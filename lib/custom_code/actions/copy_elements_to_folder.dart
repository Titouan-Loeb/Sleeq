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

Future copyElementsToFolder(
  DocumentReference destFolder,
  DocumentReference userReference,
) async {
  // Add your function code here!
  List<DocumentReference> foldersCopy = [];
  List<DocumentReference> filesCopy = [];
  for (final folder in FFAppState().selectedFolders) {
    var foldersRecordReference = FoldersRecord.createDoc(userReference);
    final folderSnapshot = await folder.get();
    final folderName = folderSnapshot.get("name");
    var folderColor = folderSnapshot.get("color");
    folderColor = "ff" + folderColor.substring(1);
    await foldersRecordReference.set(createFoldersRecordData(
      owner: userReference,
      color: Color(int.parse('0x$folderColor')),
      name: folderName + "_copy",
      parentFolder: destFolder,
    ));
    foldersCopy.add(foldersRecordReference);
  }
  await destFolder.update({
    'folders': FieldValue.arrayUnion(foldersCopy),
  });

  // logFirebaseEvent('Button_backend_call');
  //     var foldersRecordReference =
  //         FoldersRecord.createDoc(currentUserReference!);
  //     await foldersRecordReference.set(createFoldersRecordData(
  //       owner: currentUserReference,
  //       color: FFAppState().selectedColor,
  //       name: _model.textController1.text,
  //       parentFolder: widget.currentFolder,
  //     ));
  //     _model.newFolder = FoldersRecord.getDocumentFromData(
  //         createFoldersRecordData(
  //           owner: currentUserReference,
  //           color: FFAppState().selectedColor,
  //           name: _model.textController1.text,
  //           parentFolder: widget.currentFolder,
  //         ),
  //         foldersRecordReference);
  //     _shouldSetState = true;
  //     logFirebaseEvent('Button_backend_call');
  //     await widget.currentFolder!.update({
  //       'folders': FieldValue.arrayUnion([_model.newFolder?.reference]),
  //     });
}
