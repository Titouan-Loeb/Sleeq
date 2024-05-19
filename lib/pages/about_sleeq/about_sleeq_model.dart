import '/auth/firebase_auth/auth_util.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/back_button/back_button_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'about_sleeq_widget.dart' show AboutSleeqWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AboutSleeqModel extends FlutterFlowModel<AboutSleeqWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    backButtonModel = createModel(context, () => BackButtonModel());
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarModel.dispose();
    backButtonModel.dispose();
    navBarFlotingModel.dispose();
  }
}
