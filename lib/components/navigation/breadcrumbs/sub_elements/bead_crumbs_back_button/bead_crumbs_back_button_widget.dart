import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bead_crumbs_back_button_model.dart';
export 'bead_crumbs_back_button_model.dart';

class BeadCrumbsBackButtonWidget extends StatefulWidget {
  const BeadCrumbsBackButtonWidget({Key? key}) : super(key: key);

  @override
  _BeadCrumbsBackButtonWidgetState createState() =>
      _BeadCrumbsBackButtonWidgetState();
}

class _BeadCrumbsBackButtonWidgetState
    extends State<BeadCrumbsBackButtonWidget> {
  late BeadCrumbsBackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeadCrumbsBackButtonModel());

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
              logFirebaseEvent('BEAD_CRUMBS_BACK_BUTTON_arrow_back_ios_o');
              logFirebaseEvent('IconButton_update_app_state');
              setState(() {
                FFAppState().selectedFolders = [];
                FFAppState().selecteFiles = [];
                FFAppState().isSelectionMode = false;
                FFAppState().removeFromCurrentTreePath(
                    FFAppState().currentTreePath.last);
              });
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
        ),
      ),
    );
  }
}
