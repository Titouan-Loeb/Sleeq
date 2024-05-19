import '/auth/firebase_auth/auth_util.dart';
import '/components/buttons/edit_bar2/edit_bar2_widget.dart';
import '/components/buttons/new_button/new_button_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
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
import 'search_results_model.dart';
export 'search_results_model.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({
    super.key,
    required this.files,
  });

  final List<DocumentReference>? files;

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  late SearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchResults'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_RESULTS_SearchResults_ON_INIT_STA');
      logFirebaseEvent('SearchResults_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('SearchResults_update_app_state');
      setState(() {
        FFAppState().currentPage = 'HomePage';
        FFAppState().currentFolder = currentUserDocument?.rootFolder;
        FFAppState().currentTreePath = [];
      });
      logFirebaseEvent('SearchResults_update_app_state');
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
        title: 'Search result',
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
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 100.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.ResponsiveGrid(
                                        width: double.infinity,
                                        height: double.infinity,
                                        folders: functions.returnEmptyList(),
                                        files: widget.files!,
                                        folderNamesList:
                                            functions.addFolderToList(
                                                List.generate(
                                                    random_data.randomInteger(
                                                        0, 0),
                                                    (index) =>
                                                        random_data.randomName(
                                                            true,
                                                            true)).toList(),
                                                'Home'),
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
