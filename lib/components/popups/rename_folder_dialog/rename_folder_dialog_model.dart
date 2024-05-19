import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/sub_elements/color_dial/color_dial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rename_folder_dialog_widget.dart' show RenameFolderDialogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RenameFolderDialogModel
    extends FlutterFlowModel<RenameFolderDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ColorDial component.
  late ColorDialModel colorDialModel;

  @override
  void initState(BuildContext context) {
    colorDialModel = createModel(context, () => ColorDialModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    colorDialModel.dispose();
  }
}
