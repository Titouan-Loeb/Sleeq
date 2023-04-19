import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buttons/edit_bar/edit_bar_widget.dart';
import '/components/navigation/breadcrumbs/breadcrumbs/breadcrumbs_widget.dart';
import '/components/navigation/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/components/popups/add_modal/add_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for breadcrumbs component.
  late BreadcrumbsModel breadcrumbsModel;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel1;
  // Model for editBar component.
  late EditBarModel editBarModel;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    breadcrumbsModel = createModel(context, () => BreadcrumbsModel());
    navBarFlotingModel1 = createModel(context, () => NavBarFlotingModel());
    editBarModel = createModel(context, () => EditBarModel());
    navBarFlotingModel2 = createModel(context, () => NavBarFlotingModel());
  }

  void dispose() {
    sidebarModel.dispose();
    breadcrumbsModel.dispose();
    navBarFlotingModel1.dispose();
    editBarModel.dispose();
    navBarFlotingModel2.dispose();
  }

  /// Additional helper methods are added here.

}
