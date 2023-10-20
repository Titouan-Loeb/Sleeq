import '/backend/backend.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/components/v_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'file_card_widget.dart' show FileCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FileCardModel extends FlutterFlowModel<FileCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for VCard component.
  late VCardModel vCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    vCardModel = createModel(context, () => VCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sidebarModel.dispose();
    vCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
