import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/nav_bar_floting_widget.dart';
import '../components/sidebar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  'iwpjrj8g' /* Home */,
                ),
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
          child: Stack(
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: SidebarWidget(
                    pageAddress: 'homePage',
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: NavBarFlotingWidget(),
                ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  valueOrDefault<String>(
                    'launch://sleeq.app${GoRouter.of(context).location}',
                    'launch://sleeq.app/',
                  ),
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Playfair Display',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, -0.4),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('HOME_PAGE_PAGE_UPLOAD_FILE_BTN_ON_TAP');
                      final selectedFile =
                          await selectFile(allowedExtensions: ['pdf']);
                      if (selectedFile != null) {
                        setState(() => isMediaUploading = true);
                        String? downloadUrl;
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          downloadUrl = await uploadData(
                              selectedFile.storagePath, selectedFile.bytes);
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          isMediaUploading = false;
                        }
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl!);
                          showUploadMessage(
                            context,
                            'Success!',
                          );
                        } else {
                          setState(() {});
                          showUploadMessage(
                            context,
                            'Failed to upload file',
                          );
                          return;
                        }
                      }

                      final usersUpdateData = {
                        'files': FieldValue.arrayUnion([
                          getFileFirestoreData(
                            createFileStruct(
                              owner: currentUserReference,
                              fileUrl: uploadedFileUrl,
                              fileName: valueOrDefault<String>(
                                uploadedFileUrl,
                                'file.pdf',
                              ),
                              clearUnsetFields: false,
                            ),
                            true,
                          )
                        ]),
                      };
                      await currentUserReference!.update(usersUpdateData);
                    },
                    text: FFLocalizations.of(context).getText(
                      'k8d795du' /* Upload file */,
                    ),
                    options: FFButtonOptions(
                      width: 130,
                      height: 60,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'DM Sans',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                      elevation: 4,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
