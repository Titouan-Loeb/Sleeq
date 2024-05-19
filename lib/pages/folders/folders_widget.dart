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
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'folders_model.dart';
export 'folders_model.dart';

class FoldersWidget extends StatefulWidget {
  const FoldersWidget({
    super.key,
    required this.currentFolder,
    required this.folderNames,
  });

  final DocumentReference? currentFolder;
  final List<String>? folderNames;

  @override
  State<FoldersWidget> createState() => _FoldersWidgetState();
}

class _FoldersWidgetState extends State<FoldersWidget> {
  late FoldersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoldersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'folders'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FOLDERS_PAGE_folders_ON_INIT_STATE');
      logFirebaseEvent('folders_update_app_state');
      setState(() {
        FFAppState().currentPage = 'Folders';
        FFAppState().currentFolder = widget.currentFolder;
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
        title: 'your folders',
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
                                child: BreadcrumbsWidget(
                                  folderNames: widget.folderNames,
                                  allowGoBack: true,
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
                                      'w9d5ah2c' /* Grid View */,
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
                                            'FOLDERS_Switch_mk7eh8gv_ON_TOGGLE_ON');
                                        logFirebaseEvent(
                                            'Switch_update_app_state');
                                        FFAppState().gridView = true;
                                      } else {
                                        logFirebaseEvent(
                                            'FOLDERS_Switch_mk7eh8gv_ON_TOGGLE_OFF');
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
                                        isEqualTo: widget.currentFolder,
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
                                          containerFilesRecordList.length != 0,
                                      child: wrapWithModel(
                                        model: _model.cardSliderHorizontalModel,
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
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
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
                                        isEqualTo: widget.currentFolder,
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
                                          containerFilesRecordList.length != 0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.cardSliderModel,
                                          updateCallback: () => setState(() {}),
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
                            Expanded(
                              child: Stack(
                                children: [
                                  if (_model.switchValue ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 100.0),
                                      child: StreamBuilder<FoldersRecord>(
                                        stream: FoldersRecord.getDocument(
                                            widget.currentFolder!),
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
                                              files: responsiveGridFoldersRecord
                                                  .files,
                                              folderNamesList:
                                                  widget.folderNames!,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (!_model.switchValue!)
                                    StreamBuilder<FoldersRecord>(
                                      stream: FoldersRecord.getDocument(
                                          widget.currentFolder!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                                'Key0md_${folderIndex}_of_${folder.length}'),
                                                            name:
                                                                folderButtonListModeFoldersRecord
                                                                    .name,
                                                            color:
                                                                folderButtonListModeFoldersRecord
                                                                    .color!,
                                                            path:
                                                                folderButtonListModeFoldersRecord
                                                                    .reference,
                                                            previousFolders:
                                                                widget
                                                                    .folderNames!,
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
                                                            final fileButtonListModeFilesRecord =
                                                                snapshot.data!;
                                                            return FileButtonListModeWidget(
                                                              key: Key(
                                                                  'Keyddp_${fileIndex}_of_${file.length}'),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: wrapWithModel(
                      model: _model.newButtonModel,
                      updateCallback: () => setState(() {}),
                      child: NewButtonWidget(
                        currentFolder: widget.currentFolder!,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (FFAppState().isSelectionMode)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: wrapWithModel(
                              model: _model.editBar2Model,
                              updateCallback: () => setState(() {}),
                              child: EditBar2Widget(
                                currentFolder: widget.currentFolder!,
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
                          child: wrapWithModel(
                            model: _model.navBarFlotingModel,
                            updateCallback: () => setState(() {}),
                            child: NavBarFlotingWidget(
                              canAddFile: true,
                              currentFolder: widget.currentFolder,
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
  }
}
