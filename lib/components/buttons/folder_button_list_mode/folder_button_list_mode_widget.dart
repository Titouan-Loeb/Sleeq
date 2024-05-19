import '/components/buttons/edit_bar_single_folder/edit_bar_single_folder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'folder_button_list_mode_model.dart';
export 'folder_button_list_mode_model.dart';

class FolderButtonListModeWidget extends StatefulWidget {
  const FolderButtonListModeWidget({
    super.key,
    required this.name,
    required this.color,
    required this.path,
    required this.previousFolders,
  });

  final String? name;
  final Color? color;
  final DocumentReference? path;
  final List<String>? previousFolders;

  @override
  State<FolderButtonListModeWidget> createState() =>
      _FolderButtonListModeWidgetState();
}

class _FolderButtonListModeWidgetState
    extends State<FolderButtonListModeWidget> {
  late FolderButtonListModeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderButtonListModeModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('FOLDER_BUTTON_LIST_MODE_Container_q48do2');
          if (FFAppState().isSelectionMode) {
            if (FFAppState().selectedFolders.contains(widget.path)) {
              logFirebaseEvent('Container_update_app_state');
              setState(() {
                FFAppState().removeFromSelectedFolders(widget.path!);
              });
              return;
            } else {
              logFirebaseEvent('Container_update_app_state');
              setState(() {
                FFAppState().addToSelectedFolders(widget.path!);
              });
              return;
            }
          } else {
            logFirebaseEvent('Container_update_app_state');
            setState(() {
              FFAppState().selectedFolders = [];
              FFAppState().isSelectionMode = false;
              FFAppState().selecteFiles = [];
              FFAppState().addToCurrentTreePath(widget.path!);
            });
            logFirebaseEvent('Container_navigate_to');

            context.pushNamed(
              'folders',
              pathParameters: {
                'currentFolder': serializeParam(
                  widget.path,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
              queryParameters: {
                'folderNames': serializeParam(
                  functions.addFolderToList(
                      widget.previousFolders!.toList(), widget.name!),
                  ParamType.String,
                  true,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        },
        onLongPress: () async {
          logFirebaseEvent('FOLDER_BUTTON_LIST_MODE_Container_q48do2');
          logFirebaseEvent('Container_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return WebViewAware(
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: EditBarSingleFolderWidget(
                    folderReference: widget.path!,
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FFAppState().selectedFolders.contains(widget.path)
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.folder_rounded,
                  color: widget.color,
                  size: 24.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.name!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FFAppState()
                                  .selectedFolders
                                  .contains(widget.path)
                              ? FlutterFlowTheme.of(context).secondaryBackground
                              : FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'FOLDER_BUTTON_LIST_MODE_Icon_sp3c19dr_ON');
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: EditBarSingleFolderWidget(
                              folderReference: widget.path!,
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: FFAppState().selectedFolders.contains(widget.path)
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
