import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColorItemWidget extends StatefulWidget {
  const ColorItemWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  _ColorItemWidgetState createState() => _ColorItemWidgetState();
}

class _ColorItemWidgetState extends State<ColorItemWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent('COLOR_ITEM_Container_vpbc6x5c_ON_TAP');
          FFAppState().update(() {
            FFAppState().selectedColor = widget.color!;
          });
        },
        child: Container(
          width: widget.color == FFAppState().selectedColor ? 25.0 : 15.0,
          height: MediaQuery.of(context).size.width * 0.05,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
