import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/popups/sub_elements/color_dial/color_dial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_modal_model.dart';
export 'add_modal_model.dart';

class AddModalWidget extends StatefulWidget {
  const AddModalWidget({
    super.key,
    this.currentFolder,
  });

  final DocumentReference? currentFolder;

  @override
  State<AddModalWidget> createState() => _AddModalWidgetState();
}

class _AddModalWidgetState extends State<AddModalWidget> {
  late AddModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_MODAL_COMP_addModal_ON_INIT_STATE');
      logFirebaseEvent('addModal_update_app_state');
      setState(() {
        FFAppState().isEditingFolder = true;
      });
    });

    _model.textController ??= TextEditingController();
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
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 0.0,
                  runSpacing: 0.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.spaceAround,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 8.0),
                      child: AutoSizeText(
                        'Add a new ${FFAppState().isEditingFolder ? 'folder' : 'file'}',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADD_MODAL_COMP_Container_33pqa2yd_ON_TAP');
                                logFirebaseEvent(
                                    'Container_update_component_state');
                                setState(() {
                                  _model.addSelect = 1;
                                });
                                logFirebaseEvent('Container_update_app_state');
                                setState(() {
                                  FFAppState().isEditingFolder = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.addSelect != 1
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fqrx409d' /* Folder */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADD_MODAL_COMP_Container_ouc66vor_ON_TAP');
                                logFirebaseEvent(
                                    'Container_update_component_state');
                                setState(() {
                                  _model.addSelect = 2;
                                });
                                logFirebaseEvent('Container_update_app_state');
                                setState(() {
                                  FFAppState().isEditingFolder = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.addSelect != 2
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.insert_drive_file,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'pzkk6o4a' /* File */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFAppState().isEditingFolder
                                    ? 'Folder name'
                                    : 'File name',
                                hintText: FFAppState().isEditingFolder
                                    ? '[folder name]'
                                    : '[file name]',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.colorDialModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: ColorDialWidget(
                                    allowedColors: valueOrDefault<bool>(
                                            currentUserDocument?.isColorblind,
                                            false)
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('ADD_MODAL_COMP_CANCEL_BTN_ON_TAP');
                          logFirebaseEvent('Button_bottom_sheet');
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'j7nwknqr' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          hoverTextColor:
                              FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('ADD_MODAL_COMP__BTN_ON_TAP');
                          var _shouldSetState = false;
                          if (_model.addSelect == 1) {
                            logFirebaseEvent('Button_backend_call');

                            var foldersRecordReference =
                                FoldersRecord.createDoc(currentUserReference!);
                            await foldersRecordReference
                                .set(createFoldersRecordData(
                              owner: currentUserReference,
                              color: FFAppState().selectedColor,
                              name: _model.textController.text,
                              parentFolder: widget.currentFolder,
                            ));
                            _model.newFolder =
                                FoldersRecord.getDocumentFromData(
                                    createFoldersRecordData(
                                      owner: currentUserReference,
                                      color: FFAppState().selectedColor,
                                      name: _model.textController.text,
                                      parentFolder: widget.currentFolder,
                                    ),
                                    foldersRecordReference);
                            _shouldSetState = true;
                            logFirebaseEvent('Button_backend_call');

                            await widget.currentFolder!.update({
                              ...mapToFirestore(
                                {
                                  'folders': FieldValue.arrayUnion(
                                      [_model.newFolder?.reference]),
                                },
                              ),
                            });
                          } else if (_model.addSelect == 2) {
                            if (valueOrDefault(
                                    currentUserDocument?.occupiedStorage, 0.0) <
                                functions.getPlanMaxStorageInMB(valueOrDefault(
                                    currentUserDocument?.subcriptionId, ''))) {
                              logFirebaseEvent(
                                  'Button_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl != null &&
                                  _model.uploadedFileUrl != '') {
                                logFirebaseEvent('Button_haptic_feedback');
                                HapticFeedback.heavyImpact();
                                logFirebaseEvent('Button_backend_call');

                                var filesRecordReference =
                                    FilesRecord.createDoc(
                                        currentUserReference!);
                                await filesRecordReference
                                    .set(createFilesRecordData(
                                  fileUrl: _model.uploadedFileUrl,
                                  owner: currentUserReference,
                                  name: _model.textController.text,
                                  created: getCurrentTimestamp,
                                  containingFolder: widget.currentFolder,
                                  color: FFAppState().selectedColor,
                                ));
                                _model.fileOut =
                                    FilesRecord.getDocumentFromData(
                                        createFilesRecordData(
                                          fileUrl: _model.uploadedFileUrl,
                                          owner: currentUserReference,
                                          name: _model.textController.text,
                                          created: getCurrentTimestamp,
                                          containingFolder:
                                              widget.currentFolder,
                                          color: FFAppState().selectedColor,
                                        ),
                                        filesRecordReference);
                                _shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');

                                await widget.currentFolder!.update({
                                  ...mapToFirestore(
                                    {
                                      'files': FieldValue.arrayUnion(
                                          [_model.fileOut?.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent(
                                    'Button_close_dialog,_drawer,_etc');
                                Navigator.pop(context);
                                logFirebaseEvent('Button_update_app_state');
                                setState(() {});
                                logFirebaseEvent('Button_custom_action');
                                _model.tagList = await actions.getTagsFromOCR(
                                  _model.uploadedFileUrl,
                                );
                                _shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');
                                unawaited(
                                  () async {
                                    await _model.fileOut!.reference.update({
                                      ...createFilesRecordData(
                                        typeId: _model.tagList?.first?.name,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'tags': getTagsListFirestoreData(
                                            _model.tagList,
                                          ),
                                        },
                                      ),
                                    });
                                  }(),
                                );
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              logFirebaseEvent(
                                  'Button_close_dialog,_drawer,_etc');
                              Navigator.pop(context);
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Not enough space. Subscribe to a higher plan.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          logFirebaseEvent('Button_haptic_feedback');
                          HapticFeedback.heavyImpact();
                          logFirebaseEvent('Button_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          logFirebaseEvent('Button_update_app_state');
                          setState(() {});
                          if (_shouldSetState) setState(() {});
                        },
                        text: FFAppState().isEditingFolder
                            ? 'Create folder'
                            : 'Upload file',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: FlutterFlowTheme.of(context).tertiary,
                          hoverTextColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                    ],
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
