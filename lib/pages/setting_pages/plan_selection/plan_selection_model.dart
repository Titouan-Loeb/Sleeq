import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/back_button/back_button_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/components/subscription/new_plans/new_premium_plan_sleeq_advanced/new_premium_plan_sleeq_advanced_widget.dart';
import '/components/subscription/new_plans/new_premium_plan_sleeq_family/new_premium_plan_sleeq_family_widget.dart';
import '/components/subscription/new_plans/new_premium_plan_sleeq_plus/new_premium_plan_sleeq_plus_widget.dart';
import '/components/subscription/new_plans/new_premium_plan_sleeq_starter/new_premium_plan_sleeq_starter_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'plan_selection_widget.dart' show PlanSelectionWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PlanSelectionModel extends FlutterFlowModel<PlanSelectionWidget> {
  ///  Local state fields for this page.

  List<String> planIds = [];
  void addToPlanIds(String item) => planIds.add(item);
  void removeFromPlanIds(String item) => planIds.remove(item);
  void removeAtIndexFromPlanIds(int index) => planIds.removeAt(index);
  void insertAtIndexInPlanIds(int index, String item) =>
      planIds.insert(index, item);
  void updatePlanIdsAtIndex(int index, Function(String) updateFn) =>
      planIds[index] = updateFn(planIds[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for NewPremiumPlanSleeqStarter component.
  late NewPremiumPlanSleeqStarterModel newPremiumPlanSleeqStarterModel;
  // Model for NewPremiumPlanSleeqFamily component.
  late NewPremiumPlanSleeqFamilyModel newPremiumPlanSleeqFamilyModel;
  // Model for NewPremiumPlanSleeqAdvanced component.
  late NewPremiumPlanSleeqAdvancedModel newPremiumPlanSleeqAdvancedModel;
  // Model for NewPremiumPlanSleeqPlus component.
  late NewPremiumPlanSleeqPlusModel newPremiumPlanSleeqPlusModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;
  // Stores action output result for [Backend Call - API (Create Payment Link)] action in Button widget.
  ApiCallResponse? apiResult;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    newPremiumPlanSleeqStarterModel =
        createModel(context, () => NewPremiumPlanSleeqStarterModel());
    newPremiumPlanSleeqFamilyModel =
        createModel(context, () => NewPremiumPlanSleeqFamilyModel());
    newPremiumPlanSleeqAdvancedModel =
        createModel(context, () => NewPremiumPlanSleeqAdvancedModel());
    newPremiumPlanSleeqPlusModel =
        createModel(context, () => NewPremiumPlanSleeqPlusModel());
    backButtonModel = createModel(context, () => BackButtonModel());
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarModel.dispose();
    newPremiumPlanSleeqStarterModel.dispose();
    newPremiumPlanSleeqFamilyModel.dispose();
    newPremiumPlanSleeqAdvancedModel.dispose();
    newPremiumPlanSleeqPlusModel.dispose();
    backButtonModel.dispose();
    navBarFlotingModel.dispose();
  }
}
