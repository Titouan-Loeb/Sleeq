import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breadcrumb_element_model.dart';
export 'breadcrumb_element_model.dart';

class BreadcrumbElementWidget extends StatefulWidget {
  const BreadcrumbElementWidget({
    super.key,
    this.folderName,
    bool? clickable,
  }) : this.clickable = clickable ?? true;

  final String? folderName;
  final bool clickable;

  @override
  State<BreadcrumbElementWidget> createState() =>
      _BreadcrumbElementWidgetState();
}

class _BreadcrumbElementWidgetState extends State<BreadcrumbElementWidget> {
  late BreadcrumbElementModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcrumbElementModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.clickable
            ? FlutterFlowTheme.of(context).secondaryBackground
            : Color(0x00000000),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
        child: Text(
          widget.folderName!,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
              ),
        ),
      ),
    );
  }
}
