import '/components/newnav_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SidebarSmallModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for newnavSmall component.
  late NewnavSmallModel newnavSmallModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newnavSmallModel = createModel(context, () => NewnavSmallModel());
  }

  void dispose() {
    newnavSmallModel.dispose();
  }

  /// Additional helper methods are added here.

}
