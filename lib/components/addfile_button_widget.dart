import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AddfileButtonWidget extends StatefulWidget {
  const AddfileButtonWidget({
    Key? key,
    this.currentFolder,
  }) : super(key: key);

  final DocumentReference? currentFolder;

  @override
  _AddfileButtonWidgetState createState() => _AddfileButtonWidgetState();
}

class _AddfileButtonWidgetState extends State<AddfileButtonWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  FileRecord? fileOutput;
  AudioPlayer? soundPlayer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30,
      borderWidth: 1,
      buttonSize: 50,
      icon: FaIcon(
        FontAwesomeIcons.fileMedical,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 30,
      ),
      showLoadingIndicator: true,
      onPressed: () async {
        logFirebaseEvent('ADDFILE_BUTTON_fileMedical_ICN_ON_TAP');
        var _shouldSetState = false;
        final selectedFile = await selectFile(allowedExtensions: ['pdf']);
        if (selectedFile != null) {
          setState(() => isMediaUploading = true);
          String? downloadUrl;
          try {
            downloadUrl =
                await uploadData(selectedFile.storagePath, selectedFile.bytes);
          } finally {
            isMediaUploading = false;
          }
          if (downloadUrl != null) {
            setState(() => uploadedFileUrl = downloadUrl!);
          } else {
            setState(() {});
            return;
          }
        }

        if (uploadedFileUrl != null && uploadedFileUrl != '') {
          HapticFeedback.heavyImpact();

          final fileCreateData = createFileRecordData(
            fileUrl: uploadedFileUrl,
            owner: currentUserReference,
            name: uploadedFileUrl,
            created: getCurrentTimestamp,
          );
          var fileRecordReference = FileRecord.collection.doc();
          await fileRecordReference.set(fileCreateData);
          fileOutput = FileRecord.getDocumentFromData(
              fileCreateData, fileRecordReference);
          _shouldSetState = true;

          final foldersUpdateData = {
            'files': FieldValue.arrayUnion([fileOutput!.reference]),
          };
          await widget.currentFolder!.update(foldersUpdateData);
          soundPlayer ??= AudioPlayer();
          if (soundPlayer!.playing) {
            await soundPlayer!.stop();
          }
          soundPlayer!.setVolume(1);
          soundPlayer!
              .setAsset('assets/audios/vine-boom.mp3')
              .then((_) => soundPlayer!.play());
        } else {
          if (_shouldSetState) setState(() {});
          return;
        }

        if (_shouldSetState) setState(() {});
      },
    );
  }
}
