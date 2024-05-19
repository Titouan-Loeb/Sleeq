import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_button_model.dart';
export 'back_button_model.dart';

class BackButtonWidget extends StatefulWidget {
  const BackButtonWidget({super.key});

  @override
  State<BackButtonWidget> createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget> {
  late BackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: const CircleBorder(),
      child: ClipOval(
        child: Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
          ),
          child: FlutterFlowIconButton(
            buttonSize: 35.0,
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 17.0,
            ),
            onPressed: () async {
              logFirebaseEvent('BACK_BUTTON_arrow_back_ios_outlined_ICN_');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
        ),
      ),
    );
  }
}
