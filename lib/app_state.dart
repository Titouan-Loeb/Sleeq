import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Color _selectedColor = Color(4278360575);
  Color get selectedColor => _selectedColor;
  set selectedColor(Color _value) {
    _selectedColor = _value;
  }

  bool _isEditingFolder = false;
  bool get isEditingFolder => _isEditingFolder;
  set isEditingFolder(bool _value) {
    _isEditingFolder = _value;
  }

  bool _isSelectionMode = false;
  bool get isSelectionMode => _isSelectionMode;
  set isSelectionMode(bool _value) {
    _isSelectionMode = _value;
  }

  List<DocumentReference> _selectedFolders = [];
  List<DocumentReference> get selectedFolders => _selectedFolders;
  set selectedFolders(List<DocumentReference> _value) {
    _selectedFolders = _value;
  }

  void addToSelectedFolders(DocumentReference _value) {
    _selectedFolders.add(_value);
  }

  void removeFromSelectedFolders(DocumentReference _value) {
    _selectedFolders.remove(_value);
  }

  void removeAtIndexFromSelectedFolders(int _index) {
    _selectedFolders.removeAt(_index);
  }

  List<DocumentReference> _selecteFiles = [];
  List<DocumentReference> get selecteFiles => _selecteFiles;
  set selecteFiles(List<DocumentReference> _value) {
    _selecteFiles = _value;
  }

  void addToSelecteFiles(DocumentReference _value) {
    _selecteFiles.add(_value);
  }

  void removeFromSelecteFiles(DocumentReference _value) {
    _selecteFiles.remove(_value);
  }

  void removeAtIndexFromSelecteFiles(int _index) {
    _selecteFiles.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
