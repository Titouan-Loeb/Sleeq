import '../backend/backend.dart';
import '../components/add_modal_widget.dart';
import '../components/file_button_widget.dart';
import '../components/folder_button_widget.dart';
import '../components/sidebar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'folders_model.dart';
export 'folders_model.dart';

class FoldersWidget extends StatefulWidget {
  const FoldersWidget({
    Key? key,
    this.path,
    this.name,
    this.color,
  }) : super(key: key);

  final DocumentReference? path;
  final String? name;
  final Color? color;

  @override
  _FoldersWidgetState createState() => _FoldersWidgetState();
}

class _FoldersWidgetState extends State<FoldersWidget> {
  late FoldersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoldersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'folders'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          appBar: AppBar(
            backgroundColor: widget.color != null
                ? widget.color
                : FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              widget.name!,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: FlutterFlowTheme.of(context).title2Family,
                    color: Colors.white,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title2Family),
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  wrapWithModel(
                    model: _model.sidebarModel,
                    updateCallback: () => setState(() {}),
                    child: SidebarWidget(),
                  ),
                  Expanded(
                    child: StreamBuilder<FoldersRecord>(
                      stream: FoldersRecord.getDocument(widget.path!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final columnFoldersRecord = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: double.infinity,
                                child: custom_widgets.ResponsiveGrid(
                                  width: MediaQuery.of(context).size.width,
                                  height: double.infinity,
                                  folders:
                                      columnFoldersRecord.folders!.toList(),
                                  files: columnFoldersRecord.files!.toList(),
                                ),
                              ),
                            ),
                            if (false)
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final item =
                                        columnFoldersRecord.folders!.toList();
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
                                      itemCount: item.length,
                                      itemBuilder: (context, itemIndex) {
                                        final itemItem = item[itemIndex];
                                        return FutureBuilder<FoldersRecord>(
                                          future: FoldersRecord.getDocumentOnce(
                                              itemItem),
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
                                                  'Key5v8_${itemIndex}_of_${item.length}'),
                                              color: valueOrDefault<Color>(
                                                folderButtonFoldersRecord.color,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              name: folderButtonFoldersRecord
                                                  .name,
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
                            if (false)
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final files =
                                        columnFoldersRecord.files!.toList();
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
                                        return FutureBuilder<FilesRecord>(
                                          future: FilesRecord.getDocumentOnce(
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
                                            final fileButtonFilesRecord =
                                                snapshot.data!;
                                            return FileButtonWidget(
                                              key: Key(
                                                  'Keypde_${filesIndex}_of_${files.length}'),
                                              name: fileButtonFilesRecord.name,
                                              color: valueOrDefault<Color>(
                                                fileButtonFilesRecord.color,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              file: fileButtonFilesRecord,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
