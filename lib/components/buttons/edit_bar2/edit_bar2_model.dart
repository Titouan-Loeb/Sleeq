import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/copy_paste_popup/copy_paste_popup_widget.dart';
import '/components/popups/move_popup/move_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_bar2_widget.dart' show EditBar2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class EditBar2Model extends FlutterFlowModel<EditBar2Widget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  FilesRecord? file;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  FilesRecord? documentToDownload;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
