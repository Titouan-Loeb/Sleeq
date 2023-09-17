import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MovePopupModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<DocumentReference> folderList = [];
  void addToFolderList(DocumentReference item) => folderList.add(item);
  void removeFromFolderList(DocumentReference item) => folderList.remove(item);
  void removeAtIndexFromFolderList(int index) => folderList.removeAt(index);
  void updateFolderListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      folderList[index] = updateFn(folderList[index]);

  DocumentReference? componentCurrentFolder;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in MovePopup widget.
  FoldersRecord? rootFolder;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
