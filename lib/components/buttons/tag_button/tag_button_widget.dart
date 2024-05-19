import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tag_button_model.dart';
export 'tag_button_model.dart';

class TagButtonWidget extends StatefulWidget {
  const TagButtonWidget({
    super.key,
    String? name,
    Color? color,
  })  : this.name = name ?? '?',
        this.color = color ?? Colors.black;

  final String name;
  final Color color;

  @override
  State<TagButtonWidget> createState() => _TagButtonWidgetState();
}

class _TagButtonWidgetState extends State<TagButtonWidget> {
  late TagButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        height: 32.0,
        decoration: BoxDecoration(
          color: Color(0x60E3E7ED),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.color,
              FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Text(
              widget.name,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
