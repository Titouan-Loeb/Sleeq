import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/rename_folder_dialog/rename_folder_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_bar_single_file_model.dart';
export 'edit_bar_single_file_model.dart';

class EditBarSingleFileWidget extends StatefulWidget {
  const EditBarSingleFileWidget({
    super.key,
    required this.fleReference,
  });

  final DocumentReference? fleReference;

  @override
  State<EditBarSingleFileWidget> createState() =>
      _EditBarSingleFileWidgetState();
}

class _EditBarSingleFileWidgetState extends State<EditBarSingleFileWidget>
    with TickerProviderStateMixin {
  late EditBarSingleFileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditBarSingleFileModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: StreamBuilder<FilesRecord>(
              stream: FilesRecord.getDocument(widget.fleReference!),
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
                final wrapFilesRecord = snapshot.data!;
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.spaceAround,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
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
                          color: wrapFilesRecord.isBookmarked
                              ? FlutterFlowTheme.of(context).customColor3
                              : FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_BAR_SINGLE_FILE_favorite_sharp_ICN_');
                          if (wrapFilesRecord.isBookmarked) {
                            logFirebaseEvent('IconButton_backend_call');

                            await widget.fleReference!
                                .update(createFilesRecordData(
                              isBookmarked: false,
                            ));
                          } else {
                            logFirebaseEvent('IconButton_backend_call');

                            await widget.fleReference!
                                .update(createFilesRecordData(
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
                      constraints: BoxConstraints(
                        maxWidth: 356.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Builder(
                        builder: (context) => FlutterFlowIconButton(
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
                                'EDIT_BAR_SINGLE_FILE_edit_rounded_ICN_ON');
                            logFirebaseEvent('IconButton_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: RenameFolderDialogWidget(
                                      fileId: widget.fleReference,
                                      isFolder: false,
                                      name: wrapFilesRecord.name,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));

                            logFirebaseEvent(
                                'IconButton_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                          },
                        ),
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
                          Icons.download,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_BAR_SINGLE_FILE_download_ICN_ON_TAP');
                          if (isWeb) {
                            logFirebaseEvent('IconButton_custom_action');
                            await actions.downloadAnyFileOnWeb(
                              wrapFilesRecord.fileUrl,
                            );
                          } else {
                            logFirebaseEvent('IconButton_custom_action');
                            await actions.downloadAnyFileOnMobile(
                              context,
                              wrapFilesRecord.fileUrl,
                            );
                          }

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
                              'EDIT_BAR_SINGLE_FILE_delete_ICN_ON_TAP');
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

                          await wrapFilesRecord.containingFolder!.update({
                            ...mapToFirestore(
                              {
                                'files': FieldValue.arrayRemove(
                                    [widget.fleReference]),
                              },
                            ),
                          });
                          logFirebaseEvent('IconButton_backend_call');
                          await widget.fleReference!.delete();
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
                        disabledIconColor: FlutterFlowTheme.of(context).accent3,
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
                                    'EDIT_BAR_SINGLE_FILE_check_box_ICN_ON_TA');
                                logFirebaseEvent('IconButton_update_app_state');
                                FFAppState().update(() {
                                  FFAppState().isSelectionMode = true;
                                  FFAppState()
                                      .addToSelecteFiles(widget.fleReference!);
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
                      child: Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 15.0,
                          borderWidth: 1.0,
                          buttonSize: double.infinity,
                          icon: Icon(
                            Icons.share_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_BAR_SINGLE_FILE_share_rounded_ICN_O');
                            var _shouldSetState = false;
                            logFirebaseEvent('IconButton_backend_call');
                            _model.file = await FilesRecord.getDocumentOnce(
                                wrapFilesRecord.reference);
                            _shouldSetState = true;
                            logFirebaseEvent('IconButton_haptic_feedback');
                            HapticFeedback.lightImpact();
                            if (isWeb) {
                              logFirebaseEvent('IconButton_copy_to_clipboard');
                              await Clipboard.setData(
                                  ClipboardData(text: _model.file!.fileUrl));
                            } else {
                              logFirebaseEvent('IconButton_share');
                              await Share.share(
                                _model.file!.fileUrl,
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('IconButton_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Copied to clipboard',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                          },
                        ),
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
                              'EDIT_BAR_SINGLE_FILE_close_rounded_ICN_O');
                          logFirebaseEvent(
                              'IconButton_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
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
