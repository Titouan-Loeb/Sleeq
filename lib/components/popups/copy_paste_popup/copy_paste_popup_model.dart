import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'copy_paste_popup_widget.dart' show CopyPastePopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CopyPastePopupModel extends FlutterFlowModel<CopyPastePopupWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> folderList = [];
  void addToFolderList(DocumentReference item) => folderList.add(item);
  void removeFromFolderList(DocumentReference item) => folderList.remove(item);
  void removeAtIndexFromFolderList(int index) => folderList.removeAt(index);
  void insertAtIndexInFolderList(int index, DocumentReference item) =>
      folderList.insert(index, item);
  void updateFolderListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      folderList[index] = updateFn(folderList[index]);

  DocumentReference? componentCurrentFolder;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in CopyPastePopup widget.
  FoldersRecord? rootFolder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
