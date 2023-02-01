import '../backend/backend.dart';
import '../components/add_modal_widget.dart';
import '../components/file_button_widget.dart';
import '../components/folder_button_widget.dart';
import '../components/sidebar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoldersWidget extends StatefulWidget {
  const FoldersWidget({
    Key? key,
    this.path,
  }) : super(key: key);

  final DocumentReference? path;

  @override
  _FoldersWidgetState createState() => _FoldersWidgetState();
}

class _FoldersWidgetState extends State<FoldersWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'folders'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<FoldersRecord>(
      stream: FoldersRecord.getDocument(widget.path!),
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
        final foldersFoldersRecord = snapshot.data!;
        return Title(
            title: 'your folders',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  logFirebaseEvent('FOLDERS_FloatingActionButton_24kvid75_ON');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: AddModalWidget(
                          currentFolder: widget.path,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                icon: Icon(
                  Icons.add_circle,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                elevation: 8,
                label: Text(
                  FFLocalizations.of(context).getText(
                    '7kml26ln' /* New */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              appBar: responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              )
                  ? AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      automaticallyImplyLeading: true,
                      title: Text(
                        foldersFoldersRecord.name!,
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title2Family,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).title2Family),
                            ),
                      ),
                      actions: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(),
                        ),
                      ],
                      centerTitle: true,
                      elevation: 4,
                    )
                  : null,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SidebarWidget(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final items =
                                      foldersFoldersRecord.folders!.toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
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
                                        future: FoldersRecord.getDocumentOnce(
                                            itemsItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final folderButtonFoldersRecord =
                                              snapshot.data!;
                                          return FolderButtonWidget(
                                            key: Key(
                                                'folderButton_${itemsIndex}'),
                                            color: valueOrDefault<Color>(
                                              folderButtonFoldersRecord.color,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            name:
                                                folderButtonFoldersRecord.name,
                                            path: folderButtonFoldersRecord
                                                .reference,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final files =
                                      foldersFoldersRecord.files!.toList();
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: files.length,
                                    itemBuilder: (context, filesIndex) {
                                      final filesItem = files[filesIndex];
                                      return FutureBuilder<FileRecord>(
                                        future: FileRecord.getDocumentOnce(
                                            filesItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final fileButtonFileRecord =
                                              snapshot.data!;
                                          return FileButtonWidget(
                                            key:
                                                Key('fileButton_${filesIndex}'),
                                            name: fileButtonFileRecord.name,
                                            color: valueOrDefault<Color>(
                                              fileButtonFileRecord.color,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            file: fileButtonFileRecord,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
