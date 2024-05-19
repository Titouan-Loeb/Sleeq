import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'move_popup_model.dart';
export 'move_popup_model.dart';

class MovePopupWidget extends StatefulWidget {
  const MovePopupWidget({super.key});

  @override
  State<MovePopupWidget> createState() => _MovePopupWidgetState();
}

class _MovePopupWidgetState extends State<MovePopupWidget> {
  late MovePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovePopupModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MOVE_POPUP_COMP_MovePopup_ON_INIT_STATE');
      logFirebaseEvent('MovePopup_backend_call');
      _model.rootFolder =
          await FoldersRecord.getDocumentOnce(currentUserDocument!.rootFolder!);
      logFirebaseEvent('MovePopup_update_component_state');
      setState(() {
        _model.folderList =
            _model.rootFolder!.folders.toList().cast<DocumentReference>();
        _model.componentCurrentFolder = currentUserDocument?.rootFolder;
      });
    });

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: 500.0,
          height: 552.0,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(9.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 9.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFFFA0000),
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MOVE_POPUP_COMP_close_rounded_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_close_dialog,_drawer,_etc');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ch8g34ya' /* Move selected elements */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<FoldersRecord>(
                        stream: FoldersRecord.getDocument(
                            _model.componentCurrentFolder!),
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
                          final textFoldersRecord = snapshot.data!;
                          return Text(
                            _model.componentCurrentFolder ==
                                    currentUserDocument?.rootFolder
                                ? 'Home'
                                : textFoldersRecord.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 3.0,
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        final subFolder = _model.folderList.toList();
                        return SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(subFolder.length,
                                (subFolderIndex) {
                              final subFolderItem = subFolder[subFolderIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 0.0),
                                child: StreamBuilder<FoldersRecord>(
                                  stream:
                                      FoldersRecord.getDocument(subFolderItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 70.0,
                                          height: 70.0,
                                          child: SpinKitChasingDots(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 70.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerFoldersRecord =
                                        snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MOVE_POPUP_Container_nzx70z63_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_update_component_state');
                                        setState(() {
                                          _model.folderList =
                                              containerFoldersRecord.folders
                                                  .toList()
                                                  .cast<DocumentReference>();
                                          _model.componentCurrentFolder =
                                              containerFoldersRecord.reference;
                                        });
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.folder_rounded,
                                                  color: containerFoldersRecord
                                                      .color,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerFoldersRecord.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
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
                        Icons.drive_file_move_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        logFirebaseEvent(
                            'MOVE_POPUP_drive_file_move_rounded_ICN_O');
                        logFirebaseEvent('IconButton_custom_action');
                        await actions.moveElementsToFolder(
                          _model.componentCurrentFolder!,
                          FFAppState().currentTreePath.last,
                        );
                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().update(() {
                          FFAppState().selecteFiles = [];
                          FFAppState().selectedFolders = [];
                          FFAppState().isSelectionMode = false;
                        });
                        logFirebaseEvent(
                            'IconButton_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
