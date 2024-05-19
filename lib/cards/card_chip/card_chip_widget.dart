import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_chip_model.dart';
export 'card_chip_model.dart';

class CardChipWidget extends StatefulWidget {
  const CardChipWidget({super.key});

  @override
  State<CardChipWidget> createState() => _CardChipWidgetState();
}

class _CardChipWidgetState extends State<CardChipWidget> {
  late CardChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardChipModel());

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
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFFDDB34D),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
            child: Container(
              width: 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
            child: Container(
              width: 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: Container(
              width: 50.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: 15.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35.0, 10.0, 0.0, 0.0),
            child: Container(
              width: 15.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: Container(
              width: 15.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35.0, 25.0, 0.0, 0.0),
            child: Container(
              width: 15.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: Color(0xFF4F401C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
