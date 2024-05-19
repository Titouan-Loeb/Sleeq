import '/backend/backend.dart';
import '/components/buttons/edit_bar_single_file/edit_bar_single_file_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'file_button_model.dart';
export 'file_button_model.dart';

class FileButtonWidget extends StatefulWidget {
  const FileButtonWidget({
    super.key,
    this.file,
    this.name,
    this.color,
  });

  final FilesRecord? file;
  final String? name;
  final Color? color;

  @override
  State<FileButtonWidget> createState() => _FileButtonWidgetState();
}

class _FileButtonWidgetState extends State<FileButtonWidget> {
  late FileButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileButtonModel());

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
                  logFirebaseEvent('FILE_BUTTON_solidFileAlt_ICN_ON_LONG_PRE');
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
                          child: EditBarSingleFileWidget(
                            fleReference: widget.file!.reference,
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 15.0,
                  buttonSize: 100.0,
                  icon: FaIcon(
                    FontAwesomeIcons.solidFileAlt,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 80.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'FILE_BUTTON_COMP_solidFileAlt_ICN_ON_TAP');
                    if (FFAppState().isSelectionMode) {
                      if (FFAppState()
                          .selecteFiles
                          .contains(widget.file?.reference)) {
                        logFirebaseEvent('IconButton_update_app_state');
                        setState(() {
                          FFAppState()
                              .removeFromSelecteFiles(widget.file!.reference);
                        });
                        return;
                      } else {
                        logFirebaseEvent('IconButton_update_app_state');
                        setState(() {
                          FFAppState()
                              .addToSelecteFiles(widget.file!.reference);
                        });
                        return;
                      }
                    } else {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        'file',
                        queryParameters: {
                          'file': serializeParam(
                            widget.file,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'file': widget.file,
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 200),
                          ),
                        },
                      );
                    }
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, -0.85),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              if (FFAppState().isSelectionMode &&
                  FFAppState().selecteFiles.contains(widget.file?.reference))
                Align(
                  alignment: AlignmentDirectional(1.0, -0.9),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              if (FFAppState().isSelectionMode &&
                  !FFAppState().selecteFiles.contains(widget.file?.reference))
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
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ],
    );
  }
}
