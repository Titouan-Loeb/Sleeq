import '../backend/backend.dart';
import '../components/file_button_widget.dart';
import '../components/folder_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key? key,
    this.isFolder,
    this.folder,
    this.file,
  }) : super(key: key);

  final bool? isFolder;
  final DocumentReference? folder;
  final DocumentReference? file;

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.isFolder ?? true)
          FutureBuilder<FoldersRecord>(
            future: FoldersRecord.getDocumentOnce(widget.folder!),
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
              final folderButtonFoldersRecord = snapshot.data!;
              return FolderButtonWidget(
                color: folderButtonFoldersRecord.color,
                name: folderButtonFoldersRecord.name,
                path: folderButtonFoldersRecord.reference,
              );
            },
          ),
        if (!widget.isFolder!)
          FutureBuilder<FileRecord>(
            future: FileRecord.getDocumentOnce(widget.file!),
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
              final fileButtonFileRecord = snapshot.data!;
              return FileButtonWidget(
                fileUrl: fileButtonFileRecord.fileUrl,
                name: fileButtonFileRecord.name,
                color: fileButtonFileRecord.color,
              );
            },
          ),
      ],
    );
  }
}
