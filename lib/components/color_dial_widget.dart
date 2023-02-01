import '../components/color_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColorDialWidget extends StatefulWidget {
  const ColorDialWidget({
    Key? key,
    this.allowedColors,
  }) : super(key: key);

  final List<Color>? allowedColors;

  @override
  _ColorDialWidgetState createState() => _ColorDialWidgetState();
}

class _ColorDialWidgetState extends State<ColorDialWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Wrap(
      spacing: 0,
      runSpacing: 0,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      verticalDirection: VerticalDirection.down,
      clipBehavior: Clip.antiAlias,
      children: [
        ColorItemWidget(
          color: widget.allowedColors?[0],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[1],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[2],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[3],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[4],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[5],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[6],
        ),
        ColorItemWidget(
          color: widget.allowedColors?[7],
        ),
      ],
    );
  }
}
