import '/components/sleeq_logo/sleeq_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'test_on_boarding_widget.dart' show TestOnBoardingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestOnBoardingModel extends FlutterFlowModel<TestOnBoardingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sleeqLogo component.
  late SleeqLogoModel sleeqLogoModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sleeqLogoModel = createModel(context, () => SleeqLogoModel());
  }

  void dispose() {
    sleeqLogoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
