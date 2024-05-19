import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buttons/file_button_list_mode/file_button_list_mode_widget.dart';
import '/components/buttons/folder_button_list_mode/folder_button_list_mode_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/breadcrumbs/breadcrumbs/breadcrumbs_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorites_model.dart';
export 'favorites_model.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  late FavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'favorites'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FAVORITES_PAGE_favorites_ON_INIT_STATE');
      logFirebaseEvent('favorites_update_app_state');
      setState(() {
        FFAppState().currentPage = 'Folders';
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

    return StreamBuilder<List<FoldersRecord>>(
      stream: queryFoldersRecord(
        parent: currentUserReference,
        queryBuilder: (foldersRecord) => foldersRecord.where(
          'is_bookmarked',
          isEqualTo: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 70.0,
                height: 70.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 70.0,
                ),
              ),
            ),
          );
        }
        List<FoldersRecord> favoritesFoldersRecordList = snapshot.data!;
        return Title(
            title: 'your favorites',
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
                                          'Favorites'),
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
                                          'jdtyqm2r' /* Grid View */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Switch.adaptive(
                                        value: _model.switchValue ??=
                                            FFAppState().gridView,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue = newValue!);
                                          if (newValue!) {
                                            logFirebaseEvent(
                                                'FAVORITES_Switch_g02a1yvb_ON_TOGGLE_ON');
                                            logFirebaseEvent(
                                                'Switch_update_app_state');
                                            FFAppState().gridView = true;
                                          } else {
                                            logFirebaseEvent(
                                                'FAVORITES_Switch_g02a1yvb_ON_TOGGLE_OFF');
                                            logFirebaseEvent(
                                                'Switch_update_app_state');
                                            FFAppState().gridView = false;
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      if (_model.switchValue ?? true)
                                        StreamBuilder<List<FilesRecord>>(
                                          stream: queryFilesRecord(
                                            parent: currentUserReference,
                                            queryBuilder: (filesRecord) =>
                                                filesRecord.where(
                                              'is_bookmarked',
                                              isEqualTo: true,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 70.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<FilesRecord>
                                                responsiveGridFilesRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: double.infinity,
                                              child:
                                                  custom_widgets.ResponsiveGrid(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: double.infinity,
                                                folders:
                                                    favoritesFoldersRecordList
                                                        .map((e) => e.reference)
                                                        .toList(),
                                                files:
                                                    responsiveGridFilesRecordList
                                                        .map((e) => e.reference)
                                                        .toList(),
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
                                                        'Favorites'),
                                              ),
                                            );
                                          },
                                        ),
                                      if (!_model.switchValue!)
                                        StreamBuilder<List<FilesRecord>>(
                                          stream: queryFilesRecord(
                                            parent: currentUserReference,
                                            queryBuilder: (filesRecord) =>
                                                filesRecord.where(
                                              'is_bookmarked',
                                              isEqualTo: true,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 70.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<FilesRecord>
                                                containerFilesRecordList =
                                                snapshot.data!;
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final folder =
                                                            favoritesFoldersRecordList
                                                                .map((e) =>
                                                                    e.reference)
                                                                .toList();
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children:
                                                              List.generate(
                                                                  folder.length,
                                                                  (folderIndex) {
                                                            final folderItem =
                                                                folder[
                                                                    folderIndex];
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
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          70.0,
                                                                      height:
                                                                          70.0,
                                                                      child:
                                                                          SpinKitChasingDots(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            70.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final folderButtonListModeFoldersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return FolderButtonListModeWidget(
                                                                  key: Key(
                                                                      'Key7i8_${folderIndex}_of_${folder.length}'),
                                                                  name:
                                                                      folderButtonListModeFoldersRecord
                                                                          .name,
                                                                  color:
                                                                      folderButtonListModeFoldersRecord
                                                                          .color!,
                                                                  path: folderButtonListModeFoldersRecord
                                                                      .reference,
                                                                  previousFolders: functions.addFolderToList(
                                                                      List.generate(
                                                                          random_data.randomInteger(
                                                                              0,
                                                                              0),
                                                                          (index) => random_data.randomName(
                                                                              true,
                                                                              true)).toList(),
                                                                      'Favorites'),
                                                                );
                                                              },
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  100.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final file =
                                                              containerFilesRecordList
                                                                  .map((e) => e
                                                                      .reference)
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children:
                                                                List.generate(
                                                                    file.length,
                                                                    (fileIndex) {
                                                              final fileItem =
                                                                  file[
                                                                      fileIndex];
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
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            70.0,
                                                                        child:
                                                                            SpinKitChasingDots(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
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
                                                                        'Keyxz8_${fileIndex}_of_${file.length}'),
                                                                    name: fileButtonListModeFilesRecord
                                                                        .name,
                                                                    color: fileButtonListModeFilesRecord
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
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                                    canAddFile: false,
                                    currentFolder:
                                        currentUserDocument?.rootFolder,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
