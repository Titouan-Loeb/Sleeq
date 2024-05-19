import '/auth/firebase_auth/auth_util.dart';
import '/components/buttons/edit_bar2/edit_bar2_widget.dart';
import '/components/buttons/new_button/new_button_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'search_results_widget.dart' show SearchResultsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultsModel extends FlutterFlowModel<SearchResultsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for newButton component.
  late NewButtonModel newButtonModel;
  // Model for editBar2 component.
  late EditBar2Model editBar2Model;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    newButtonModel = createModel(context, () => NewButtonModel());
    editBar2Model = createModel(context, () => EditBar2Model());
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarModel.dispose();
    newButtonModel.dispose();
    editBar2Model.dispose();
    navBarFlotingModel.dispose();
  }
}
