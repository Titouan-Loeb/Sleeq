import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FileListWidget extends StatefulWidget {
  const FileListWidget({Key? key}) : super(key: key);

  @override
  _FileListWidgetState createState() => _FileListWidgetState();
}

class _FileListWidgetState extends State<FileListWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<FileRecord>>(
      stream: queryFileRecord(
        queryBuilder: (fileRecord) =>
            fileRecord.where('owner', isEqualTo: currentUserReference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<FileRecord> listViewFileRecordList = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewFileRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewFileRecord = listViewFileRecordList[listViewIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'FILE_LIST_COMP_Text_j3i70bma_ON_TAP');
                          await launchURL(listViewFileRecord.fileUrl!);
                        },
                        child: Text(
                          listViewFileRecord.fileUrl!
                              .maybeHandleOverflow(maxChars: 30),
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                fontSize: 14,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                                lineHeight: 1,
                              ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).customColor3,
                        size: 30,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('FILE_LIST_COMP_delete_ICN_ON_TAP');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Delete File'),
                                  content: Text(
                                      'Are you sure you want to delete this file?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await listViewFileRecord.reference.delete();

                          final foldersUpdateData = {
                            'files': FieldValue.arrayRemove(
                                [listViewFileRecord.reference]),
                          };
                          await listViewFileRecord.containingFolder!
                              .update(foldersUpdateData);
                          HapticFeedback.vibrate();
                        } else {
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
