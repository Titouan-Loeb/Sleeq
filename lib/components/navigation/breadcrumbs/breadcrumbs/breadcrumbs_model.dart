import '/components/navigation/breadcrumbs/sub_elements/bead_crumbs_back_button/bead_crumbs_back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'breadcrumbs_widget.dart' show BreadcrumbsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BreadcrumbsModel extends FlutterFlowModel<BreadcrumbsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BeadCrumbsBackButton component.
  late BeadCrumbsBackButtonModel beadCrumbsBackButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    beadCrumbsBackButtonModel =
        createModel(context, () => BeadCrumbsBackButtonModel());
  }

  void dispose() {
    beadCrumbsBackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
