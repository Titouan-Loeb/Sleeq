import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/rename_folder_dialog/rename_folder_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_bar_single_folder_model.dart';
export 'edit_bar_single_folder_model.dart';

class EditBarSingleFolderWidget extends StatefulWidget {
  const EditBarSingleFolderWidget({
    super.key,
    required this.folderReference,
  });

  final DocumentReference? folderReference;

  @override
  State<EditBarSingleFolderWidget> createState() =>
      _EditBarSingleFolderWidgetState();
}

class _EditBarSingleFolderWidgetState extends State<EditBarSingleFolderWidget>
    with TickerProviderStateMixin {
  late EditBarSingleFolderModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditBarSingleFolderModel());

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: 298.0,
              height: 66.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: StreamBuilder<FoldersRecord>(
                stream: FoldersRecord.getDocument(widget.folderReference!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: SpinKitChasingDots(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 70.0,
                        ),
                      ),
                    );
                  }
                  final rowFoldersRecord = snapshot.data!;
                  return Row(
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
                            Icons.favorite_sharp,
                            color: rowFoldersRecord.isBookmarked
                                ? FlutterFlowTheme.of(context).customColor3
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_BAR_SINGLE_FOLDER_favorite_sharp_IC');
                            if (rowFoldersRecord.isBookmarked) {
                              logFirebaseEvent('IconButton_backend_call');

                              await widget.folderReference!
                                  .update(createFoldersRecordData(
                                isBookmarked: false,
                              ));
                            } else {
                              logFirebaseEvent('IconButton_backend_call');

                              await widget.folderReference!
                                  .update(createFoldersRecordData(
                                isBookmarked: true,
                              ));
                            }

                            logFirebaseEvent('IconButton_update_app_state');
                            setState(() {});
                            logFirebaseEvent(
                                'IconButton_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
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
                            Icons.edit_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_BAR_SINGLE_FOLDER_edit_rounded_ICN_');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: RenameFolderDialogWidget(
                                      folderId: widget.folderReference,
                                      isFolder: true,
                                      name: rowFoldersRecord.name,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
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
                          borderColor: Colors.transparent,
                          borderRadius: 15.0,
                          borderWidth: 1.0,
                          buttonSize: double.infinity,
                          icon: Icon(
                            Icons.delete,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_BAR_SINGLE_FOLDER_delete_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_widget_animation');
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent(
                                'IconButton_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            logFirebaseEvent('IconButton_backend_call');

                            await rowFoldersRecord.parentFolder!.update({
                              ...mapToFirestore(
                                {
                                  'folders': FieldValue.arrayRemove(
                                      [widget.folderReference]),
                                },
                              ),
                            });
                            logFirebaseEvent('IconButton_backend_call');
                            await widget.folderReference!.delete();
                            logFirebaseEvent('IconButton_update_app_state');
                            FFAppState().update(() {});
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
                          borderColor: Colors.transparent,
                          borderRadius: 15.0,
                          borderWidth: 1.0,
                          buttonSize: double.infinity,
                          disabledIconColor:
                              FlutterFlowTheme.of(context).accent3,
                          icon: Icon(
                            Icons.check_box,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: functions.endsWith(
                                  'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                                  'favorites')
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'EDIT_BAR_SINGLE_FOLDER_check_box_ICN_ON_');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().isSelectionMode = true;
                                    FFAppState().addToSelectedFolders(
                                        widget.folderReference!);
                                  });
                                  logFirebaseEvent(
                                      'IconButton_close_dialog,_drawer,_etc');
                                  Navigator.pop(context);
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
                            logFirebaseEvent(
                                'EDIT_BAR_SINGLE_FOLDER_close_rounded_ICN');
                            logFirebaseEvent(
                                'IconButton_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
                  );
                },
              ),
            ),
          )
              .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
              .animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
        ],
      ),
    );
  }
}
