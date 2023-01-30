import '../backend/backend.dart';
import '../components/nav_bar_floting_widget.dart';
import '../components/sidebar_widget.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FileWidget extends StatefulWidget {
  const FileWidget({
    Key? key,
    this.file,
  }) : super(key: key);

  final FileRecord? file;

  @override
  _FileWidgetState createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'file'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'file',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  automaticallyImplyLeading: true,
                  title: Text(
                    widget.file!.name!,
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 4,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SidebarWidget(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                            child: FlutterFlowPdfViewer(
                              networkPath: widget.file!.fileUrl!,
                              width: MediaQuery.of(context).size.width,
                              horizontalScroll: false,
                            ),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: NavBarFlotingWidget(),
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
  }
}
