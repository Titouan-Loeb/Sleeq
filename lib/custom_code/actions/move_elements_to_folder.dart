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

Future moveElementsToFolder(
    DocumentReference destFolder, DocumentReference sourceFolder) async {
  destFolder.update({
    'folders': FieldValue.arrayUnion(FFAppState().selectedFolders),
    'files': FieldValue.arrayUnion(FFAppState().selecteFiles),
  });
  sourceFolder.update({
    'folders': FieldValue.arrayRemove(FFAppState().selectedFolders),
    'files': FieldValue.arrayRemove(FFAppState().selecteFiles),
  });
  for (final folder in FFAppState().selectedFolders) {
    folder.update({
      'parent_folder': destFolder,
    });
  }
  for (final file in FFAppState().selecteFiles) {
    file.update({
      'containing_folder': destFolder,
    });
  }
}
