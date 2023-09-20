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

Future deleteFolderAndItsContent(DocumentReference folder) async {
  // Add your function code here!
  final FirebaseStorage storage = FirebaseStorage.instance;
  final folderSnapshot = await folder.get();
  if (folderSnapshot.exists) {
    Map<String, dynamic> datamap =
        folderSnapshot.data() as Map<String, dynamic>;
    if (datamap.containsKey("folder")) {
      final subFolders = await folderSnapshot.get("folder");
      for (final subFolder in subFolders) deleteFolderAndItsContent(subFolder);
    }
    if (datamap.containsKey("files")) {
      final subFiles = await folderSnapshot.get("files");
      for (final file in subFiles) {
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
  folder.delete();
}
