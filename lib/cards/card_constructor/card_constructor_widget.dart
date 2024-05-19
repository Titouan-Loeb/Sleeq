import '/backend/backend.dart';
import '/cards/fr_driving_license/fr_driving_license_widget.dart';
import '/cards/fr_id_card/fr_id_card_widget.dart';
import '/cards/fr_vitale_card/fr_vitale_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_constructor_model.dart';
export 'card_constructor_model.dart';

class CardConstructorWidget extends StatefulWidget {
  const CardConstructorWidget({
    super.key,
    required this.file,
  });

  final FilesRecord? file;

  @override
  State<CardConstructorWidget> createState() => _CardConstructorWidgetState();
}

class _CardConstructorWidgetState extends State<CardConstructorWidget> {
  late CardConstructorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardConstructorModel());

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
      width: 320.0,
      height: 190.0,
      decoration: BoxDecoration(),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('CARD_CONSTRUCTOR_Stack_bmi9uol8_ON_TAP');
          logFirebaseEvent('Stack_navigate_to');

          context.pushNamed(
            'file',
            queryParameters: {
              'file': serializeParam(
                widget.file,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'file': widget.file,
            },
          );
        },
        child: Stack(
          children: [
            if (widget.file?.typeId == 'fr id card')
              wrapWithModel(
                model: _model.frIdCardModel,
                updateCallback: () => setState(() {}),
                child: FrIdCardWidget(),
              ),
            if (widget.file?.typeId == 'fr health card')
              wrapWithModel(
                model: _model.frVitaleCardModel,
                updateCallback: () => setState(() {}),
                child: FrVitaleCardWidget(),
              ),
            if (widget.file?.typeId == 'fr driving licence')
              wrapWithModel(
                model: _model.frDrivingLicenseModel,
                updateCallback: () => setState(() {}),
                child: FrDrivingLicenseWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
