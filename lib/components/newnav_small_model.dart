import '/auth/auth_util.dart';
import '/components/sleeq_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewnavSmallModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for sleeqLogo component.
  late SleeqLogoModel sleeqLogoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sleeqLogoModel = createModel(context, () => SleeqLogoModel());
  }

  void dispose() {
    sleeqLogoModel.dispose();
  }

  /// Additional helper methods are added here.

}
