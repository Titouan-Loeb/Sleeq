import '/backend/backend.dart';
import '/components/buttons/edit_bar/edit_bar_widget.dart';
import '/components/navigation/breadcrumbs/breadcrumbs/breadcrumbs_widget.dart';
import '/components/navigation/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/components/popups/add_modal/add_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'folders_model.dart';
export 'folders_model.dart';

class FoldersWidget extends StatefulWidget {
  const FoldersWidget({
    Key? key,
    this.currentFolder,
    this.folderNames,
  }) : super(key: key);

  final DocumentReference? currentFolder;
  final List<String>? folderNames;

  @override
  _FoldersWidgetState createState() => _FoldersWidgetState();
}

class _FoldersWidgetState extends State<FoldersWidget> {
  late FoldersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoldersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'folders'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<FoldersRecord>(
      future: FoldersRecord.getDocumentOnce(widget.currentFolder!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final foldersFoldersRecord = snapshot.data!;
        return Title(
            title: 'your folders',
            color: FlutterFlowTheme.of(context).primary,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: Visibility(
                  visible: false,
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      logFirebaseEvent(
                          'FOLDERS_FloatingActionButton_24kvid75_ON');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x00000000),
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (bottomSheetContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: Padding(
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: AddModalWidget(
                                currentFolder: widget.currentFolder,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    backgroundColor: FlutterFlowTheme.of(context).tertiary,
                    icon: Icon(
                      Icons.add_circle,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    elevation: 8.0,
                    label: Text(
                      FFLocalizations.of(context).getText(
                        '7kml26ln' /* New */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      wrapWithModel(
                        model: _model.sidebarModel,
                        updateCallback: () => setState(() {}),
                        child: SidebarWidget(),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.breadcrumbsModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: BreadcrumbsWidget(
                                      folderNames: widget.folderNames?.toList(),
                                      isHomeScreen: false,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: double.infinity,
                                    child: custom_widgets.ResponsiveGrid(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: double.infinity,
                                      folders: foldersFoldersRecord.folders!
                                          .toList(),
                                      files:
                                          foldersFoldersRecord.files!.toList(),
                                      folderNamesList:
                                          widget.folderNames!.toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppState().isSelectionMode)
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  child: wrapWithModel(
                                    model: _model.editBarModel,
                                    updateCallback: () => setState(() {}),
                                    child: EditBarWidget(),
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
