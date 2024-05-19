import '/backend/backend.dart';
import '/components/buttons/edit_bar_single_file/edit_bar_single_file_widget.dart';
import '/components/popups/rename_folder_dialog/rename_folder_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'file_button_list_mode_model.dart';
export 'file_button_list_mode_model.dart';

class FileButtonListModeWidget extends StatefulWidget {
  const FileButtonListModeWidget({
    super.key,
    required this.name,
    required this.color,
    required this.document,
  });

  final String? name;
  final Color? color;
  final FilesRecord? document;

  @override
  State<FileButtonListModeWidget> createState() =>
      _FileButtonListModeWidgetState();
}

class _FileButtonListModeWidgetState extends State<FileButtonListModeWidget> {
  late FileButtonListModeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileButtonListModeModel());

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

    return Builder(
      builder: (context) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('FILE_BUTTON_LIST_MODE_Container_e6dhyc7o');
            if (FFAppState().isSelectionMode) {
              if (FFAppState()
                  .selecteFiles
                  .contains(widget.document?.reference)) {
                logFirebaseEvent('Container_update_app_state');
                setState(() {
                  FFAppState()
                      .removeFromSelecteFiles(widget.document!.reference);
                });
                return;
              } else {
                logFirebaseEvent('Container_update_app_state');
                setState(() {
                  FFAppState().addToSelecteFiles(widget.document!.reference);
                });
                return;
              }
            } else {
              logFirebaseEvent('Container_navigate_to');

              context.pushNamed(
                'file',
                queryParameters: {
                  'file': serializeParam(
                    widget.document,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'file': widget.document,
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 200),
                  ),
                },
              );
            }
          },
          onDoubleTap: () async {
            logFirebaseEvent('FILE_BUTTON_LIST_MODE_Container_e6dhyc7o');
            logFirebaseEvent('Container_alert_dialog');
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: WebViewAware(
                    child: RenameFolderDialogWidget(
                      fileId: widget.document?.reference,
                      isFolder: false,
                      name: widget.name!,
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          },
          onLongPress: () async {
            logFirebaseEvent('FILE_BUTTON_LIST_MODE_Container_e6dhyc7o');
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
                    child: EditBarSingleFileWidget(
                      fleReference: widget.document!.reference,
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
              color:
                  FFAppState().selecteFiles.contains(widget.document?.reference)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidFileAlt,
                    color: widget.color,
                    size: 24.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.name!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FFAppState()
                                    .selecteFiles
                                    .contains(widget.document?.reference)
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
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
                          'FILE_BUTTON_LIST_MODE_Icon_u4jx9qps_ON_T');
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
                              child: EditBarSingleFileWidget(
                                fleReference: widget.document!.reference,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: FFAppState()
                              .selecteFiles
                              .contains(widget.document?.reference)
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
      ),
    );
  }
}
