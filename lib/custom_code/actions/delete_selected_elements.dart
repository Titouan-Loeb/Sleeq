// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
  if (selectedFolders != null) {
    sourceFolder.update({
      'folders': FieldValue.arrayRemove(selectedFolders),
    });
    for (final folder in selectedFolders) {
      folder.delete();
    }
  }
  if (selectedFiles != null) {
    sourceFolder.update({
      'files': FieldValue.arrayRemove(selectedFiles),
    });
    for (final file in selectedFiles) {
      file.delete();
    }
  }
}
