import '/components/subscription/feature_description/feature_description_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_premium_plan_sleeq_plus_widget.dart'
    show NewPremiumPlanSleeqPlusWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewPremiumPlanSleeqPlusModel
    extends FlutterFlowModel<NewPremiumPlanSleeqPlusWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for featureDescription component.
  late FeatureDescriptionModel featureDescriptionModel1;
  // Model for featureDescription component.
  late FeatureDescriptionModel featureDescriptionModel2;
  // Model for featureDescription component.
  late FeatureDescriptionModel featureDescriptionModel3;
  // Model for featureDescription component.
  late FeatureDescriptionModel featureDescriptionModel4;

  @override
  void initState(BuildContext context) {
    featureDescriptionModel1 =
        createModel(context, () => FeatureDescriptionModel());
    featureDescriptionModel2 =
        createModel(context, () => FeatureDescriptionModel());
    featureDescriptionModel3 =
        createModel(context, () => FeatureDescriptionModel());
    featureDescriptionModel4 =
        createModel(context, () => FeatureDescriptionModel());
  }

  @override
  void dispose() {
    featureDescriptionModel1.dispose();
    featureDescriptionModel2.dispose();
    featureDescriptionModel3.dispose();
    featureDescriptionModel4.dispose();
  }
}
