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

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:mime_type/mime_type.dart';

Future downloadAnyFileOnMobile(BuildContext context, String url) async {
  // Add your function code here!
  String? ext = (url!.split(".").last);
  String? extension = (ext.split("?").first);
  Dio dio = Dio();

  try {
    // Fetch the file
    Response response =
        await dio.get(url, options: Options(responseType: ResponseType.bytes));

    // Get the download directory path
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // Generate a unique file name
    String fileName =
        'downloaded_file_${DateTime.now().millisecondsSinceEpoch.toString()}.$extension';

    String? mimeType = mime(fileName);
    DocumentFileSavePlus().saveFile(response.data, fileName, mimeType!);
    // saveFile(response.data, fileName, mimeType);
    // Create the file path
    String filePath = '$appDocPath/$fileName';

    // Write the file
    File file = File(filePath);
    await file.writeAsBytes(response.data, flush: true);

    print('File downloaded to: $filePath');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("File downloaded"),
    ));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("The file couln't be savede"),
    ));
  }
}
