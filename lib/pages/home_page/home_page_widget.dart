import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/cards/card_slider/card_slider_widget.dart';
import '/cards/card_slider_horizontal/card_slider_horizontal_widget.dart';
import '/components/buttons/edit_bar2/edit_bar2_widget.dart';
import '/components/buttons/file_button_list_mode/file_button_list_mode_widget.dart';
import '/components/buttons/folder_button_list_mode/folder_button_list_mode_widget.dart';
import '/components/buttons/new_button/new_button_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/breadcrumbs/breadcrumbs/breadcrumbs_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('HomePage_update_app_state');
      setState(() {
        FFAppState().currentPage = 'HomePage';
        FFAppState().currentFolder = currentUserDocument?.rootFolder;
        FFAppState().currentTreePath = [];
      });
      logFirebaseEvent('HomePage_update_app_state');
      setState(() {
        FFAppState().addToCurrentTreePath(currentUserDocument!.rootFolder!);
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
    context.watch<FFAppState>();

    return Title(
        title: 'HomePage',
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
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.sidebarModel,
                        updateCallback: () => setState(() {}),
                        child: SidebarWidget(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.breadcrumbsModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: BreadcrumbsWidget(
                                  folderNames: functions.addFolderToList(
                                      List.generate(
                                          random_data.randomInteger(0, 0),
                                          (index) => random_data.randomName(
                                              true, true)).toList(),
                                      'Home'),
                                  allowGoBack: false,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'yjm0b1dl' /* Grid View */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.switchValue ??=
                                        FFAppState().gridView,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.switchValue = newValue!);
                                      if (newValue!) {
                                        logFirebaseEvent(
                                            'HOME_Switch_42tblfqi_ON_TOGGLE_ON');
                                        logFirebaseEvent(
                                            'Switch_update_app_state');
                                        FFAppState().gridView = true;
                                      } else {
                                        logFirebaseEvent(
                                            'HOME_Switch_42tblfqi_ON_TOGGLE_OFF');
                                        logFirebaseEvent(
                                            'Switch_update_app_state');
                                        FFAppState().gridView = false;
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<FilesRecord>>(
                                  stream: queryFilesRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (filesRecord) => filesRecord
                                        .whereIn(
                                            'typeId',
                                            functions.getCardIds() != ''
                                                ? functions.getCardIds()
                                                : null)
                                        .where(
                                          'containing_folder',
                                          isEqualTo:
                                              currentUserDocument?.rootFolder,
                                        ),
                                  ),
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
                                    List<FilesRecord> containerFilesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            containerFilesRecordList.length !=
                                                0,
                                        child: wrapWithModel(
                                          model:
                                              _model.cardSliderHorizontalModel,
                                          updateCallback: () => setState(() {}),
                                          child: CardSliderHorizontalWidget(
                                            cards: containerFilesRecordList
                                                .map((e) => e.reference)
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<FilesRecord>>(
                                  stream: queryFilesRecord(
                                    parent: currentUserReference,
                                    queryBuilder: (filesRecord) => filesRecord
                                        .whereIn(
                                            'typeId',
                                            functions.getCardIds() != ''
                                                ? functions.getCardIds()
                                                : null)
                                        .where(
                                          'containing_folder',
                                          isEqualTo:
                                              currentUserDocument?.rootFolder,
                                        ),
                                  ),
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
                                    List<FilesRecord> containerFilesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible:
                                            containerFilesRecordList.length !=
                                                0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.cardSliderModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CardSliderWidget(
                                              cards: containerFilesRecordList
                                                  .map((e) => e.reference)
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            Expanded(
                              child: Stack(
                                children: [
                                  if (_model.switchValue ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 100.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            FutureBuilder<FoldersRecord>(
                                          future: FFAppState().homegrid(
                                            overrideCache: true,
                                            requestFn: () =>
                                                FoldersRecord.getDocumentOnce(
                                                    currentUserDocument!
                                                        .rootFolder!),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  child: SpinKitChasingDots(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 70.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final responsiveGridFoldersRecord =
                                                snapshot.data!;
                                            return Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child:
                                                  custom_widgets.ResponsiveGrid(
                                                width: double.infinity,
                                                height: double.infinity,
                                                folders:
                                                    responsiveGridFoldersRecord
                                                        .folders,
                                                files:
                                                    responsiveGridFoldersRecord
                                                        .files,
                                                folderNamesList:
                                                    functions.addFolderToList(
                                                        List.generate(
                                                            random_data
                                                                .randomInteger(
                                                                    0, 0),
                                                            (index) => random_data
                                                                .randomName(
                                                                    true,
                                                                    true)).toList(),
                                                        'Home'),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (!_model.switchValue!)
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          FutureBuilder<FoldersRecord>(
                                        future: FFAppState().homegrid(
                                          overrideCache: true,
                                          requestFn: () =>
                                              FoldersRecord.getDocumentOnce(
                                                  currentUserDocument!
                                                      .rootFolder!),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 70.0,
                                                height: 70.0,
                                                child: SpinKitChasingDots(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 70.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnFoldersRecord =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final folder =
                                                        columnFoldersRecord
                                                            .folders
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                          folder.length,
                                                          (folderIndex) {
                                                        final folderItem =
                                                            folder[folderIndex];
                                                        return StreamBuilder<
                                                            FoldersRecord>(
                                                          stream: FoldersRecord
                                                              .getDocument(
                                                                  folderItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 70.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final folderButtonListModeFoldersRecord =
                                                                snapshot.data!;
                                                            return FolderButtonListModeWidget(
                                                              key: Key(
                                                                  'Keyuml_${folderIndex}_of_${folder.length}'),
                                                              name:
                                                                  folderButtonListModeFoldersRecord
                                                                      .name,
                                                              color:
                                                                  folderButtonListModeFoldersRecord
                                                                      .color!,
                                                              path:
                                                                  folderButtonListModeFoldersRecord
                                                                      .reference,
                                                              previousFolders: functions.addFolderToList(
                                                                  List.generate(
                                                                      random_data.randomInteger(0, 0),
                                                                      (index) => random_data.randomString(
                                                                            0,
                                                                            0,
                                                                            true,
                                                                            false,
                                                                            false,
                                                                          )).toList(),
                                                                  'Home'),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 100.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final file =
                                                          columnFoldersRecord
                                                              .files
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            file.length,
                                                            (fileIndex) {
                                                          final fileItem =
                                                              file[fileIndex];
                                                          return StreamBuilder<
                                                              FilesRecord>(
                                                            stream: FilesRecord
                                                                .getDocument(
                                                                    fileItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 70.0,
                                                                    height:
                                                                        70.0,
                                                                    child:
                                                                        SpinKitChasingDots(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          70.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final fileButtonListModeFilesRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return FileButtonListModeWidget(
                                                                key: Key(
                                                                    'Keyqyc_${fileIndex}_of_${file.length}'),
                                                                name:
                                                                    fileButtonListModeFilesRecord
                                                                        .name,
                                                                color:
                                                                    fileButtonListModeFilesRecord
                                                                        .color!,
                                                                document:
                                                                    fileButtonListModeFilesRecord,
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.newButtonModel,
                      updateCallback: () => setState(() {}),
                      child: NewButtonWidget(
                        currentFolder: currentUserDocument!.rootFolder!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (FFAppState().isSelectionMode)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.editBar2Model,
                                updateCallback: () => setState(() {}),
                                child: EditBar2Widget(
                                  currentFolder:
                                      currentUserDocument!.rootFolder!,
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.navBarFlotingModel,
                                updateCallback: () => setState(() {}),
                                child: NavBarFlotingWidget(
                                  key: ValueKey('NavBarFloting_wocd'),
                                  canAddFile: true,
                                  currentFolder:
                                      currentUserDocument?.rootFolder,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
