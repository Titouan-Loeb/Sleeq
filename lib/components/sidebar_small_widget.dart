import '/components/newnav_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sidebar_small_model.dart';
export 'sidebar_small_model.dart';

class SidebarSmallWidget extends StatefulWidget {
  const SidebarSmallWidget({Key? key}) : super(key: key);

  @override
  _SidebarSmallWidgetState createState() => _SidebarSmallWidgetState();
}

class _SidebarSmallWidgetState extends State<SidebarSmallWidget> {
  late SidebarSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SidebarSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: wrapWithModel(
        model: _model.newnavSmallModel,
        updateCallback: () => setState(() {}),
        child: NewnavSmallWidget(),
      ),
    );
  }
}
