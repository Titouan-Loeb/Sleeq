import '/components/buttons/edit_bar_single_folder/edit_bar_single_folder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'folder_button_model.dart';
export 'folder_button_model.dart';

class FolderButtonWidget extends StatefulWidget {
  const FolderButtonWidget({
    super.key,
    Color? color,
    required this.name,
    required this.path,
    required this.previousFolderNames,
    this.document,
    this.folderDocument,
  }) : this.color = color ?? const Color(0xFFFF0000);

  final Color color;
  final String? name;
  final DocumentReference? path;
  final List<String>? previousFolderNames;
  final DocumentReference? document;
  final DocumentReference? folderDocument;

  @override
  State<FolderButtonWidget> createState() => _FolderButtonWidgetState();
}

class _FolderButtonWidgetState extends State<FolderButtonWidget> {
  late FolderButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FolderButtonModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          child: Stack(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onLongPress: () async {
                  logFirebaseEvent('FOLDER_BUTTON_folder_rounded_ICN_ON_LONG');
                  logFirebaseEvent('IconButton_bottom_sheet');
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
                child: FlutterFlowIconButton(
                  borderRadius: 15.0,
                  buttonSize: 100.0,
                  icon: Icon(
                    Icons.folder_rounded,
                    color: widget.color,
                    size: 80.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('FOLDER_BUTTON_folder_rounded_ICN_ON_TAP');
                    if (FFAppState().isSelectionMode) {
                      if (FFAppState().selectedFolders.contains(widget.path)) {
                        logFirebaseEvent('IconButton_update_app_state');
                        setState(() {
                          FFAppState().removeFromSelectedFolders(widget.path!);
                        });
                        return;
                      } else {
                        logFirebaseEvent('IconButton_update_app_state');
                        setState(() {
                          FFAppState().addToSelectedFolders(widget.path!);
                        });
                        return;
                      }
                    } else {
                      logFirebaseEvent('IconButton_update_app_state');
                      setState(() {
                        FFAppState().selectedFolders = [];
                        FFAppState().isSelectionMode = false;
                        FFAppState().selecteFiles = [];
                        FFAppState().addToCurrentTreePath(widget.path!);
                      });
                      logFirebaseEvent('IconButton_navigate_to');

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
                                widget.previousFolderNames!.toList(),
                                widget.name!),
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
                ),
              ),
              if (FFAppState().isSelectionMode &&
                  FFAppState().selectedFolders.contains(widget.path))
                Align(
                  alignment: AlignmentDirectional(1.0, -0.9),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              if (FFAppState().isSelectionMode &&
                  !FFAppState().selectedFolders.contains(widget.path))
                Align(
                  alignment: AlignmentDirectional(1.0, -0.9),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
            ],
          ),
        ),
        Text(
          widget.name!.maybeHandleOverflow(
            maxChars: 10,
            replacement: '…',
          ),
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ],
    );
  }
}
