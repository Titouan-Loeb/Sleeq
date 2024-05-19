import '/components/popups/sub_elements/color_item/color_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'color_dial_widget.dart' show ColorDialWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ColorDialModel extends FlutterFlowModel<ColorDialWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for colorItem component.
  late ColorItemModel colorItemModel1;
  // Model for colorItem component.
  late ColorItemModel colorItemModel2;
  // Model for colorItem component.
  late ColorItemModel colorItemModel3;
  // Model for colorItem component.
  late ColorItemModel colorItemModel4;
  // Model for colorItem component.
  late ColorItemModel colorItemModel5;
  // Model for colorItem component.
  late ColorItemModel colorItemModel6;
  // Model for colorItem component.
  late ColorItemModel colorItemModel7;
  // Model for colorItem component.
  late ColorItemModel colorItemModel8;

  @override
  void initState(BuildContext context) {
    colorItemModel1 = createModel(context, () => ColorItemModel());
    colorItemModel2 = createModel(context, () => ColorItemModel());
    colorItemModel3 = createModel(context, () => ColorItemModel());
    colorItemModel4 = createModel(context, () => ColorItemModel());
    colorItemModel5 = createModel(context, () => ColorItemModel());
    colorItemModel6 = createModel(context, () => ColorItemModel());
    colorItemModel7 = createModel(context, () => ColorItemModel());
    colorItemModel8 = createModel(context, () => ColorItemModel());
  }

  @override
  void dispose() {
    colorItemModel1.dispose();
    colorItemModel2.dispose();
    colorItemModel3.dispose();
    colorItemModel4.dispose();
    colorItemModel5.dispose();
    colorItemModel6.dispose();
    colorItemModel7.dispose();
    colorItemModel8.dispose();
  }
}
