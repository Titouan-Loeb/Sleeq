import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'copy_paste_smarphone_page_widget.dart'
    show CopyPasteSmarphonePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CopyPasteSmarphonePageModel
    extends FlutterFlowModel<CopyPasteSmarphonePageWidget> {
  ///  Local state fields for this page.

  DocumentReference? currentPageFolder;

  List<DocumentReference> folderList = [];
  void addToFolderList(DocumentReference item) => folderList.add(item);
  void removeFromFolderList(DocumentReference item) => folderList.remove(item);
  void removeAtIndexFromFolderList(int index) => folderList.removeAt(index);
  void insertAtIndexInFolderList(int index, DocumentReference item) =>
      folderList.insert(index, item);
  void updateFolderListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      folderList[index] = updateFn(folderList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in CopyPasteSmarphonePage widget.
  FoldersRecord? rootFolder;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
  }
}
