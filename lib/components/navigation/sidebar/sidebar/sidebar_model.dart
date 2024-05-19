import '/components/navigation/sidebar/sub_elements/newnav/newnav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sidebar_widget.dart' show SidebarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SidebarModel extends FlutterFlowModel<SidebarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for newnav component.
  late NewnavModel newnavModel;

  @override
  void initState(BuildContext context) {
    newnavModel = createModel(context, () => NewnavModel());
  }

  @override
  void dispose() {
    newnavModel.dispose();
  }
}
