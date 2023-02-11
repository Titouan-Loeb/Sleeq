// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../components/folder_button_widget.dart';

class TestGrid extends StatefulWidget {
  const TestGrid({
    Key? key,
    this.width,
    this.height,
    required this.folders,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DocumentReference> folders;

  @override
  _TestGridState createState() => _TestGridState();
}

class _TestGridState extends State<TestGrid> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Builder(
        builder: (context) {
          final items = widget.folders;
          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            primary: false,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, itemsIndex) {
              final itemsItem = items[itemsIndex];
              return FutureBuilder<FoldersRecord>(
                future: FoldersRecord.getDocumentOnce(itemsItem),
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
                    key: Key('folderButton_${itemsIndex}'),
                    color: valueOrDefault<Color>(
                      folderButtonFoldersRecord.color,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    name: folderButtonFoldersRecord.name,
                    path: folderButtonFoldersRecord.reference,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
