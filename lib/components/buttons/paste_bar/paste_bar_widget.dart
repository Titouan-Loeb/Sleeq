import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paste_bar_model.dart';
export 'paste_bar_model.dart';

class PasteBarWidget extends StatefulWidget {
  const PasteBarWidget({Key? key}) : super(key: key);

  @override
  _PasteBarWidgetState createState() => _PasteBarWidgetState();
}

class _PasteBarWidgetState extends State<PasteBarWidget> {
  late PasteBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasteBarModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: const CircleBorder(),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).tertiary,
                icon: Icon(
                  Icons.content_paste,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PASTE_BAR_COMP_content_paste_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_update_app_state');
                  _model.updatePage(() {
                    FFAppState().pastingMode = false;
                  });
                  logFirebaseEvent('IconButton_custom_action');
                  await actions.addSelectedElementsToCurrentFolder();
                  logFirebaseEvent('IconButton_update_app_state');
                  _model.updatePage(() {
                    FFAppState().selectedFolders = [];
                    FFAppState().selecteFiles = [];
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: const CircleBorder(),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).customColor3,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PASTE_BAR_COMP_close_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_update_app_state');
                  _model.updatePage(() {
                    FFAppState().pastingMode = false;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
