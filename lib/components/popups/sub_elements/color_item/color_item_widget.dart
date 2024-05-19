import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_item_model.dart';
export 'color_item_model.dart';

class ColorItemWidget extends StatefulWidget {
  const ColorItemWidget({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  State<ColorItemWidget> createState() => _ColorItemWidgetState();
}

class _ColorItemWidgetState extends State<ColorItemWidget> {
  late ColorItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorItemModel());

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

    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        if (widget.color == FFAppState().selectedColor)
          Padding(
            padding: EdgeInsets.all(1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('COLOR_ITEM_Container_vpbc6x5c_ON_TAP');
                logFirebaseEvent('Container_update_app_state');
                FFAppState().update(() {
                  FFAppState().selectedColor = widget.color!;
                });
              },
              child: Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FFAppState().selectedColor == widget.color
                        ? FlutterFlowTheme.of(context).primaryText
                        : Color(0x00000000),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        if (widget.color != FFAppState().selectedColor)
          Padding(
            padding: EdgeInsets.all(6.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('COLOR_ITEM_Container_pepf6454_ON_TAP');
                logFirebaseEvent('Container_update_app_state');
                FFAppState().update(() {
                  FFAppState().selectedColor = widget.color!;
                });
              },
              child: Container(
                width: 25.0,
                height: 25.0,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FFAppState().selectedColor == widget.color
                        ? FlutterFlowTheme.of(context).primaryText
                        : Color(0x00000000),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
