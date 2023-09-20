// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future deleteSelectedElements(
  DocumentReference sourceFolder,
  List<DocumentReference>? selectedFolders,
  List<DocumentReference>? selectedFiles,
) async {
  // Add your function code here!
  final FirebaseStorage storage = FirebaseStorage.instance;
  if (selectedFolders != null) {
    sourceFolder.update({
      'folders': FieldValue.arrayRemove(FFAppState().selectedFolders),
    });
    for (final folder in FFAppState().selectedFolders) {
      deleteFolderAndItsContent(folder);
      // final folderSnapshot = await folder.get();
      // if (folderSnapshot.exists) {
      //   List<DocumentReference>? subFolders = null;
      //   List<DocumentReference>? subFiles = null;
      //   if (folderSnapshot.data.containsKey("folder"))
      //     subFolders = await folderSnapshot.get("folder");
      //   if (folderSnapshot.data().containsKey("files"))
      //     subFiles = await folderSnapshot.get("files");
      //   deleteSelectedElements(folder, subFolder, subFiles);
      // }
      // folder.delete();
    }
  }
  if (selectedFiles != null) {
    sourceFolder.update({
      'files': FieldValue.arrayRemove(FFAppState().selecteFiles),
    });
    for (final file in FFAppState().selecteFiles) {
      final fileSnapshot = await file.get();
      if (fileSnapshot.exists) {
        final fileUrl = fileSnapshot.get("file_url");
        file.delete().then((_) {
          Reference fileReference = storage.refFromURL(fileUrl);
          fileReference.delete();
        });
      }
    }
  }
}
