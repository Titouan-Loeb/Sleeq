import '/cards/card_chip/card_chip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'fr_vitale_card_widget.dart' show FrVitaleCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrVitaleCardModel extends FlutterFlowModel<FrVitaleCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CardChip component.
  late CardChipModel cardChipModel;

  @override
  void initState(BuildContext context) {
    cardChipModel = createModel(context, () => CardChipModel());
  }

  @override
  void dispose() {
    cardChipModel.dispose();
  }
}
