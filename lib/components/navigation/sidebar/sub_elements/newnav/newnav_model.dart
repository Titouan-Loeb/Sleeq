import '/auth/firebase_auth/auth_util.dart';
import '/components/popups/search_popup/search_popup_widget.dart';
import '/components/sleeq_logo/sleeq_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'newnav_widget.dart' show NewnavWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewnavModel extends FlutterFlowModel<NewnavWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for sleeqLogo component.
  late SleeqLogoModel sleeqLogoModel;

  @override
  void initState(BuildContext context) {
    sleeqLogoModel = createModel(context, () => SleeqLogoModel());
  }

  @override
  void dispose() {
    sleeqLogoModel.dispose();
  }
}
