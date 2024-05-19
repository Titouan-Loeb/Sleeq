import '/components/popups/copy_paste_popup/copy_paste_popup_widget.dart';
import '/components/popups/move_popup/move_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_bar2_model.dart';
export 'edit_bar2_model.dart';

class EditBar2Widget extends StatefulWidget {
  const EditBar2Widget({
    super.key,
    required this.currentFolder,
  });

  final DocumentReference? currentFolder;

  @override
  State<EditBar2Widget> createState() => _EditBar2WidgetState();
}

class _EditBar2WidgetState extends State<EditBar2Widget>
    with TickerProviderStateMixin {
  late EditBar2Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditBar2Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 100.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: 66.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                  shape: BoxShape.rectangle,
                ),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 15.0,
                  borderWidth: 1.0,
                  buttonSize: double.infinity,
                  icon: Icon(
                    Icons.drive_file_move,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('EDIT_BAR2_drive_file_move_ICN_ON_TAP');
                    if (isWeb) {
                      logFirebaseEvent('IconButton_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: MovePopupWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        'MoveSmarphonePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                  shape: BoxShape.rectangle,
                ),
                child: FlutterFlowIconButton(
                  borderRadius: 15.0,
                  borderWidth: 1.0,
                  buttonSize: double.infinity,
                  icon: Icon(
                    Icons.file_copy,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('EDIT_BAR2_COMP_file_copy_ICN_ON_TAP');
                    if (isWeb) {
                      logFirebaseEvent('IconButton_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: CopyPastePopupWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        'CopyPasteSmarphonePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                  shape: BoxShape.rectangle,
                ),
                child: FlutterFlowIconButton(
                  borderRadius: 15.0,
                  borderWidth: 1.0,
                  buttonSize: double.infinity,
                  icon: Icon(
                    Icons.delete,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('EDIT_BAR2_COMP_delete_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_custom_action');
                    await actions.deleteSelectedElements(
                      widget.currentFolder!,
                      FFAppState().selectedFolders.toList(),
                      FFAppState().selecteFiles.toList(),
                    );
                    logFirebaseEvent('IconButton_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().update(() {
                      FFAppState().selectedFolders = [];
                      FFAppState().selecteFiles = [];
                      FFAppState().isSelectionMode = false;
                    });
                  },
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(15.0),
                  shape: BoxShape.rectangle,
                ),
                child: FlutterFlowIconButton(
                  borderRadius: 15.0,
                  borderWidth: 1.0,
                  buttonSize: double.infinity,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Color(0xFFFA0000),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('EDIT_BAR2_COMP_close_rounded_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('IconButton_update_app_state');
                    _model.updatePage(() {
                      FFAppState().selectedFolders = [];
                      FFAppState().isSelectionMode = false;
                      FFAppState().selecteFiles = [];
                    });
                  },
                ),
              ),
            ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
          ),
        ),
      )
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
          .animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
    );
  }
}
