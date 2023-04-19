import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buttons/edit_bar/edit_bar_widget.dart';
import '/components/navigation/breadcrumbs/breadcrumbs/breadcrumbs_widget.dart';
import '/components/navigation/nav_bar_floting/nav_bar_floting_widget.dart';
import '/components/navigation/sidebar/sidebar/sidebar_widget.dart';
import '/components/popups/add_modal/add_modal_widget.dart';
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
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<FoldersRecord>(
        stream: FoldersRecord.getDocument(currentUserDocument!.rootFolder!),
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
          final homePageFoldersRecord = snapshot.data!;
          return Title(
              title: 'HomePage',
              color: FlutterFlowTheme.of(context).primary,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  floatingActionButton: Visibility(
                    visible: false,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        logFirebaseEvent(
                            'HOME_FloatingActionButton_yjr8ax35_ON_TA');
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
                                padding: MediaQuery.of(bottomSheetContext)
                                    .viewInsets,
                                child: AddModalWidget(
                                  currentFolder:
                                      currentUserDocument!.rootFolder,
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
                          '48yqj92v' /* New */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.ResponsiveGrid(
                                        width: double.infinity,
                                        height: double.infinity,
                                        folders: homePageFoldersRecord.folders!
                                            .toList(),
                                        files: homePageFoldersRecord.files!
                                            .toList(),
                                        folderNamesList: List.generate(
                                            random_data.randomInteger(0, 0),
                                            (index) => random_data.randomName(
                                                true, true)).toList(),
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
                                      model: _model.navBarFlotingModel1,
                                      updateCallback: () => setState(() {}),
                                      child: NavBarFlotingWidget(
                                        canAddFile: false,
                                        currentFolder: null,
                                      ),
                                    ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (FFAppState().isSelectionMode)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: wrapWithModel(
                                            model: _model.editBarModel,
                                            updateCallback: () =>
                                                setState(() {}),
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
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: wrapWithModel(
                                          model: _model.navBarFlotingModel2,
                                          updateCallback: () => setState(() {}),
                                          child: NavBarFlotingWidget(
                                            canAddFile: true,
                                            currentFolder:
                                                currentUserDocument!.rootFolder,
                                          ),
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
                  ),
                ),
              ));
        },
      ),
    );
  }
}
