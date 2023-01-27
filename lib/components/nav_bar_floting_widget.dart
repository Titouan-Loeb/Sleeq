import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({Key? key}) : super(key: key);

  @override
  _NavBarFlotingWidgetState createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  FileRecord? fileOutput;
  FoldersRecord? folder;
  AudioPlayer? soundPlayer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Color(0x33000000),
                offset: Offset(0, 5),
              )
            ],
            borderRadius: BorderRadius.circular(40),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          color: ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                      'launch://sleeq.app/') ||
                                  ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                      'launch://sleeq.app/homePage')
                              ? FlutterFlowTheme.of(context).tertiaryColor
                              : FlutterFlowTheme.of(context).primaryText,
                          size: 25,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_COMP_home_ICN_ON_TAP');
                          if (('launch://sleeq.app${GoRouter.of(context).location}' !=
                                  'launch://sleeq.app/') &&
                              ('launch://sleeq.app${GoRouter.of(context).location}' !=
                                  'launch://sleeq.app/homePage')) {
                            context.pushNamed(
                              'HomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 35,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_COMP_add_ICN_ON_TAP');
                          var _shouldSetState = false;
                          final selectedFile =
                              await selectFile(allowedExtensions: ['pdf']);
                          if (selectedFile != null) {
                            setState(() => isMediaUploading = true);
                            String? downloadUrl;
                            try {
                              downloadUrl = await uploadData(
                                  selectedFile.storagePath, selectedFile.bytes);
                            } finally {
                              isMediaUploading = false;
                            }
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl = downloadUrl!);
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          if (uploadedFileUrl != null &&
                              uploadedFileUrl != '') {
                            HapticFeedback.heavyImpact();

                            final fileCreateData = createFileRecordData(
                              fileUrl: uploadedFileUrl,
                              owner: currentUserReference,
                              name: uploadedFileUrl,
                              created: getCurrentTimestamp,
                            );
                            var fileRecordReference =
                                FileRecord.collection.doc();
                            await fileRecordReference.set(fileCreateData);
                            fileOutput = FileRecord.getDocumentFromData(
                                fileCreateData, fileRecordReference);
                            _shouldSetState = true;

                            final foldersCreateData = {
                              ...createFoldersRecordData(
                                owner: currentUserReference,
                                color: FlutterFlowTheme.of(context)
                                    .selectorLightPink,
                                name: 'default',
                              ),
                              'files': [fileOutput!.reference],
                            };
                            var foldersRecordReference =
                                FoldersRecord.createDoc(currentUserReference!);
                            await foldersRecordReference.set(foldersCreateData);
                            folder = FoldersRecord.getDocumentFromData(
                                foldersCreateData, foldersRecordReference);
                            _shouldSetState = true;
                            soundPlayer ??= AudioPlayer();
                            if (soundPlayer!.playing) {
                              await soundPlayer!.stop();
                            }
                            soundPlayer!.setVolume(1);
                            soundPlayer!
                                .setAsset('assets/audios/vine-boom.mp3')
                                .then((_) => soundPlayer!.play());
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.settings,
                          color:
                              'launch://sleeq.app${GoRouter.of(context).location}' ==
                                      'launch://sleeq.app/settings'
                                  ? FlutterFlowTheme.of(context).tertiaryColor
                                  : FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_COMP_settings_ICN_ON_TAP');
                          if ('launch://sleeq.app${GoRouter.of(context).location}' !=
                              'launch://sleeq.app/settings') {
                            context.pushNamed(
                              'Settings',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
