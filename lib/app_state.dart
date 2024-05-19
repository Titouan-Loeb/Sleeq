import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _usedStorage = prefs.getDouble('ff_usedStorage') ?? _usedStorage;
    });
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

  void updateSelectedFoldersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedFolders[_index] = updateFn(_selectedFolders[_index]);
  }

  void insertAtIndexInSelectedFolders(int _index, DocumentReference _value) {
    _selectedFolders.insert(_index, _value);
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

  void updateSelecteFilesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selecteFiles[_index] = updateFn(_selecteFiles[_index]);
  }

  void insertAtIndexInSelecteFiles(int _index, DocumentReference _value) {
    _selecteFiles.insert(_index, _value);
  }

  double _usedStorage = 0.0;
  double get usedStorage => _usedStorage;
  set usedStorage(double _value) {
    _usedStorage = _value;
    prefs.setDouble('ff_usedStorage', _value);
  }

  String _dynamicLinkDomain = 'https://sleeq.page.link';
  String get dynamicLinkDomain => _dynamicLinkDomain;
  set dynamicLinkDomain(String _value) {
    _dynamicLinkDomain = _value;
  }

  String _packageName = 'com.sleeq.app';
  String get packageName => _packageName;
  set packageName(String _value) {
    _packageName = _value;
  }

  String _paymentLink = '';
  String get paymentLink => _paymentLink;
  set paymentLink(String _value) {
    _paymentLink = _value;
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String _value) {
    _currentPage = _value;
  }

  bool _gridView = true;
  bool get gridView => _gridView;
  set gridView(bool _value) {
    _gridView = _value;
  }

  DocumentReference? _currentFolder;
  DocumentReference? get currentFolder => _currentFolder;
  set currentFolder(DocumentReference? _value) {
    _currentFolder = _value;
  }

  bool _pastingMode = false;
  bool get pastingMode => _pastingMode;
  set pastingMode(bool _value) {
    _pastingMode = _value;
  }

  List<DocumentReference> _currentTreePath = [];
  List<DocumentReference> get currentTreePath => _currentTreePath;
  set currentTreePath(List<DocumentReference> _value) {
    _currentTreePath = _value;
  }

  void addToCurrentTreePath(DocumentReference _value) {
    _currentTreePath.add(_value);
  }

  void removeFromCurrentTreePath(DocumentReference _value) {
    _currentTreePath.remove(_value);
  }

  void removeAtIndexFromCurrentTreePath(int _index) {
    _currentTreePath.removeAt(_index);
  }

  void updateCurrentTreePathAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _currentTreePath[_index] = updateFn(_currentTreePath[_index]);
  }

  void insertAtIndexInCurrentTreePath(int _index, DocumentReference _value) {
    _currentTreePath.insert(_index, _value);
  }

  bool _editSingleFile = false;
  bool get editSingleFile => _editSingleFile;
  set editSingleFile(bool _value) {
    _editSingleFile = _value;
  }

  bool _editSingleFolder = false;
  bool get editSingleFolder => _editSingleFolder;
  set editSingleFolder(bool _value) {
    _editSingleFolder = _value;
  }

  final _homegridManager = FutureRequestManager<FoldersRecord>();
  Future<FoldersRecord> homegrid({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<FoldersRecord> Function() requestFn,
  }) =>
      _homegridManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomegridCache() => _homegridManager.clear();
  void clearHomegridCacheKey(String? uniqueKey) =>
      _homegridManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
