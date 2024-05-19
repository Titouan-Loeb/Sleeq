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

Future<List<DocumentReference>> getDocumentsRefsFromStrings(
    List<dynamic> files) async {
  List<DocumentReference<Object?>> documentReferences = [];
  debugPrint('files : ${files}');
  // Initialize Firebase Storage
  var db = FirebaseFirestore.instance;

  // Loop through the filesList and retrieve document references
  for (var filePath in files) {
    try {
      // Create a reference to the file in Firebase Storage
      var reference = db.doc(filePath['path']);

      // Add the reference to the list after casting
      documentReferences.add(reference);
    } catch (e) {
      print('Error retrieving reference for $filePath: $e');
    }
  }

  return documentReferences;
}
