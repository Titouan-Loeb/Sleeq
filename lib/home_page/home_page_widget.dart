import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_modal_widget.dart';
import '/components/breadcrumbs_widget.dart';
import '/components/edit_bar_widget.dart';
import '/components/nav_bar_floting_widget.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_PAGE_LOAD');
      await actions.lockOrientation();
    });

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

    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: !FFAppState().isSelectionMode,
            child: FloatingActionButton.extended(
              onPressed: () async {
                logFirebaseEvent('HOME_FloatingActionButton_yjr8ax35_ON_TA');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: false,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AddModalWidget(
                        currentFolder: currentUserDocument!.rootFolder,
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
              icon: Icon(
                Icons.add_circle,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              elevation: 8.0,
              label: Text(
                FFLocalizations.of(context).getText(
                  '48yqj92v' /* New */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'DM Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.breadcrumbsModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: BreadcrumbsWidget(
                                  isHomeScreen: true,
                                  folderNames: List.generate(
                                      random_data.randomInteger(0, 0),
                                      (index) => random_data.randomName(
                                          true, true)).toList(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<FoldersRecord>(
                                  stream: FoldersRecord.getDocument(
                                      currentUserDocument!.rootFolder!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final responsiveGridFoldersRecord =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.ResponsiveGrid(
                                        width: double.infinity,
                                        height: double.infinity,
                                        folders: responsiveGridFoldersRecord
                                            .folders!
                                            .toList(),
                                        files: responsiveGridFoldersRecord
                                            .files!
                                            .toList(),
                                        folderNamesList: List.generate(
                                            random_data.randomInteger(0, 0),
                                            (index) => random_data.randomName(
                                                true, true)).toList(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (false &&
                                responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                              wrapWithModel(
                                model: _model.navBarFlotingModel,
                                updateCallback: () => setState(() {}),
                                child: NavBarFlotingWidget(),
                              ),
                          ],
                        ),
                        if (FFAppState().isSelectionMode)
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: wrapWithModel(
                                model: _model.editBarModel,
                                updateCallback: () => setState(() {}),
                                child: EditBarWidget(),
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
