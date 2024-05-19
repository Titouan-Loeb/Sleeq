import '/backend/backend.dart';
import '/cards/fr_driving_license/fr_driving_license_widget.dart';
import '/cards/fr_id_card/fr_id_card_widget.dart';
import '/cards/fr_vitale_card/fr_vitale_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_constructor_widget.dart' show CardConstructorWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardConstructorModel extends FlutterFlowModel<CardConstructorWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FR_ID_CARD component.
  late FrIdCardModel frIdCardModel;
  // Model for FR_VITALE_CARD component.
  late FrVitaleCardModel frVitaleCardModel;
  // Model for FR_DRIVING_LICENSE component.
  late FrDrivingLicenseModel frDrivingLicenseModel;

  @override
  void initState(BuildContext context) {
    frIdCardModel = createModel(context, () => FrIdCardModel());
    frVitaleCardModel = createModel(context, () => FrVitaleCardModel());
    frDrivingLicenseModel = createModel(context, () => FrDrivingLicenseModel());
  }

  @override
  void dispose() {
    frIdCardModel.dispose();
    frVitaleCardModel.dispose();
    frDrivingLicenseModel.dispose();
  }
}
