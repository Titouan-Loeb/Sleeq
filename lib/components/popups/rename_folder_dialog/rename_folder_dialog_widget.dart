import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/sub_elements/color_dial/color_dial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rename_folder_dialog_model.dart';
export 'rename_folder_dialog_model.dart';

class RenameFolderDialogWidget extends StatefulWidget {
  const RenameFolderDialogWidget({
    super.key,
    this.folderId,
    this.fileId,
    this.isFolder,
    required this.name,
  });

  final DocumentReference? folderId;
  final DocumentReference? fileId;
  final bool? isFolder;
  final String? name;

  @override
  State<RenameFolderDialogWidget> createState() =>
      _RenameFolderDialogWidgetState();
}

class _RenameFolderDialogWidgetState extends State<RenameFolderDialogWidget> {
  late RenameFolderDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RenameFolderDialogModel());

    _model.textController ??= TextEditingController(text: widget.name);
    _model.textFieldFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 600.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '62s1el54' /* Rename */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gx7f6c8b' /* Enter the new name below */,
                    ),
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'b7er5pp3' /* Label here... */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).accent1,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.colorDialModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: ColorDialWidget(
                      allowedColors: valueOrDefault<bool>(
                              currentUserDocument?.isColorblind, false)
                          ? ([
                              Color(0xFFC600FF),
                              Color(0xFFB200FF),
                              Color(0xFF0070FF),
                              Color(0xFF00A6FF),
                              Color(0xFF00FF80),
                              Color(0xFF80FF00),
                              Color(0xFFFF6A00),
                              Color(0xFFFF0000)
                            ])
                          : ([
                              Color(0xFFFFC6FF),
                              Color(0xFFBDB2FF),
                              Color(0xFFA0C4FF),
                              Color(0xFF9BF6FF),
                              Color(0xFFCAFFBF),
                              Color(0xFFFDFFB6),
                              Color(0xFFFFD6A5),
                              Color(0xFFFFADAD)
                            ]),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'RENAME_FOLDER_DIALOG_CANCEL_BTN_ON_TAP');
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'kmvite4a' /* Cancel */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        hoverColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        hoverTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RENAME_FOLDER_DIALOG_CONFIRM_BTN_ON_TAP');
                          if (widget.isFolder!) {
                            logFirebaseEvent('Button_backend_call');

                            await widget.folderId!
                                .update(createFoldersRecordData(
                              name: _model.textController.text,
                              color: FFAppState().selectedColor,
                            ));
                            logFirebaseEvent(
                                'Button_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            return;
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            await widget.fileId!.update(createFilesRecordData(
                              name: _model.textController.text,
                              color: FFAppState().selectedColor,
                            ));
                            logFirebaseEvent(
                                'Button_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            return;
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'kds0ysdx' /* Confirm */,
                        ),
                        options: FFButtonOptions(
                          width: 125.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
