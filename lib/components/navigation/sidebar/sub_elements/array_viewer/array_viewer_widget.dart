import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'array_viewer_model.dart';
export 'array_viewer_model.dart';

class ArrayViewerWidget extends StatefulWidget {
  const ArrayViewerWidget({super.key});

  @override
  State<ArrayViewerWidget> createState() => _ArrayViewerWidgetState();
}

class _ArrayViewerWidgetState extends State<ArrayViewerWidget> {
  late ArrayViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArrayViewerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final treeFolder = FFAppState().currentTreePath.toList();
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(treeFolder.length, (treeFolderIndex) {
            final treeFolderItem = treeFolder[treeFolderIndex];
            return AuthUserStreamWidget(
              builder: (context) => StreamBuilder<FoldersRecord>(
                stream: FoldersRecord.getDocument(treeFolderItem),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: SpinKitChasingDots(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 70.0,
                        ),
                      ),
                    );
                  }
                  final textFoldersRecord = snapshot.data!;
                  return Text(
                    textFoldersRecord.reference ==
                            currentUserDocument?.rootFolder
                        ? 'Home'
                        : textFoldersRecord.name,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  );
                },
              ),
            );
          }),
        );
      },
    );
  }
}
