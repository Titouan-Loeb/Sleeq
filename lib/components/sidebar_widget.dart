import '../components/newnav_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        width: 270,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: NewnavWidget(),
        ),
      ),
    );
  }
}
