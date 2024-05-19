import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'copy_paste_smarphone_page_model.dart';
export 'copy_paste_smarphone_page_model.dart';

class CopyPasteSmarphonePageWidget extends StatefulWidget {
  const CopyPasteSmarphonePageWidget({super.key});

  @override
  State<CopyPasteSmarphonePageWidget> createState() =>
      _CopyPasteSmarphonePageWidgetState();
}

class _CopyPasteSmarphonePageWidgetState
    extends State<CopyPasteSmarphonePageWidget> {
  late CopyPasteSmarphonePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopyPasteSmarphonePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CopyPasteSmarphonePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COPY_PASTE_SMARPHONE_CopyPasteSmarphoneP');
      logFirebaseEvent('CopyPasteSmarphonePage_backend_call');
      _model.rootFolder =
          await FoldersRecord.getDocumentOnce(currentUserDocument!.rootFolder!);
      logFirebaseEvent('CopyPasteSmarphonePage_update_page_state');
      setState(() {
        _model.currentPageFolder = _model.rootFolder?.reference;
        _model.folderList =
            _model.rootFolder!.folders.toList().cast<DocumentReference>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'CopyPasteSmarphonePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '7iwe6ghx' /* Paste selected elements */,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.backButtonModel,
                              updateCallback: () => setState(() {}),
                              child: BackButtonWidget(),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<FoldersRecord>(
                                  stream: FoldersRecord.getDocument(
                                      _model.currentPageFolder!),
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
                                    final textFoldersRecord = snapshot.data!;
                                    return Text(
                                      _model.currentPageFolder ==
                                              currentUserDocument?.rootFolder
                                          ? 'Home'
                                          : textFoldersRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final subFolder = _model.folderList.toList();
                                  return SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(subFolder.length,
                                          (subFolderIndex) {
                                        final subFolderItem =
                                            subFolder[subFolderIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: StreamBuilder<FoldersRecord>(
                                            stream: FoldersRecord.getDocument(
                                                subFolderItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    child: SpinKitChasingDots(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'COPY_PASTE_SMARPHONE_Container_mr3p9huj_');
                                                  logFirebaseEvent(
                                                      'Container_update_page_state');
                                                  setState(() {
                                                    _model.currentPageFolder =
                                                        containerFoldersRecord
                                                            .reference;
                                                    _model.folderList =
                                                        containerFoldersRecord
                                                            .folders
                                                            .toList()
                                                            .cast<
                                                                DocumentReference>();
                                                  });
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .folder_rounded,
                                                            color:
                                                                containerFoldersRecord
                                                                    .color,
                                                            size: 24.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              containerFoldersRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(15.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 15.0,
                              borderWidth: 1.0,
                              buttonSize: double.infinity,
                              icon: Icon(
                                Icons.content_paste_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                logFirebaseEvent(
                                    'COPY_PASTE_SMARPHONE_content_paste_round');
                                logFirebaseEvent('IconButton_custom_action');
                                await actions.copyElementsToFolder(
                                  _model.currentPageFolder!,
                                  currentUserReference!,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
