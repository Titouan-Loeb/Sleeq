import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadFileButtonWidget extends StatefulWidget {
  const UploadFileButtonWidget({Key? key}) : super(key: key);

  @override
  _UploadFileButtonWidgetState createState() => _UploadFileButtonWidgetState();
}

class _UploadFileButtonWidgetState extends State<UploadFileButtonWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: FFButtonWidget(
        onPressed: () async {
          logFirebaseEvent('UPLOAD_FILE_BUTTON_UPLOAD_FILE_BTN_ON_TA');
          // Upload File
          final selectedFile = await selectFile(allowedExtensions: ['pdf']);
          if (selectedFile != null) {
            setState(() => isMediaUploading = true);
            String? downloadUrl;
            try {
              showUploadMessage(
                context,
                'Uploading file...',
                showLoading: true,
              );
              downloadUrl = await uploadData(
                  selectedFile.storagePath, selectedFile.bytes);
            } finally {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              isMediaUploading = false;
            }
            if (downloadUrl != null) {
              setState(() => uploadedFileUrl = downloadUrl!);
              showUploadMessage(
                context,
                'Success!',
              );
            } else {
              setState(() {});
              showUploadMessage(
                context,
                'Failed to upload file',
              );
              return;
            }
          }

          final filesCreateData = createFilesRecordData(
            owner: currentUserReference,
            name: uploadedFileUrl,
            fileUrl: uploadedFileUrl,
          );
          await FilesRecord.createDoc(currentUserReference!)
              .set(filesCreateData);
        },
        text: FFLocalizations.of(context).getText(
          '0nhn733d' /* Upload file */,
        ),
        options: FFButtonOptions(
          height: 60,
          color: FlutterFlowTheme.of(context).primaryColor,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).subtitle2Family),
              ),
          elevation: 4,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
      ),
    );
  }
}
