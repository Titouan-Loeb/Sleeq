import '/components/popups/add_modal/add_modal_widget.dart';
import '/components/popups/search_popup/search_popup_widget.dart';
import '/components/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nav_bar_floting_model.dart';
export 'nav_bar_floting_model.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({
    super.key,
    bool? canAddFile,
    this.currentFolder,
  }) : this.canAddFile = canAddFile ?? true;

  final bool canAddFile;
  final DocumentReference? currentFolder;

  @override
  State<NavBarFlotingWidget> createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  late NavBarFlotingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarFlotingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: FaIcon(
                      FontAwesomeIcons.home,
                      color: valueOrDefault<Color>(
                        functions.endsWith(
                                    'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                                    'HomePage') ||
                                functions.endsWith(
                                    'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                                    '/')
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryText,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      size: 25.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('NAV_BAR_FLOTING_COMP_home_ICN_ON_TAP');
                      if (!functions.endsWith(
                          'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                          'HomePage')) {
                        logFirebaseEvent('IconButton_navigate_to');

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
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.favorite,
                      color: functions.endsWith(
                              'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                              'favorites')
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 33.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'NAV_BAR_FLOTING_COMP_favorite_ICN_ON_TAP');
                      if (!functions.endsWith(
                          'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                          'favorites')) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(
                          'favorites',
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
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.settings,
                      color: functions.endsWith(
                              'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                              'settings')
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 33.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'NAV_BAR_FLOTING_COMP_settings_ICN_ON_TAP');
                      if (!functions.endsWith(
                          'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                          'settings')) {
                        logFirebaseEvent('IconButton_navigate_to');

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
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: valueOrDefault<Color>(
                        functions.endsWith(
                                'launch://sleeq.page.link${GoRouterState.of(context).uri.toString()}',
                                'ScanPage')
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryText,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      size: 33.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'NAV_BAR_FLOTING_qr_code_scanner_ICN_ON_T');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(
                        'ScanPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 6.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'NAV_BAR_FLOTING_COMP_search_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SearchPopupWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onLongPress: () async {
                        logFirebaseEvent(
                            'NAV_BAR_FLOTING_add_ICN_ON_LONG_PRESS');
                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: SearchBarWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        disabledColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        disabledIconColor: Color(0xFFB1D3F1),
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 30.0,
                        ),
                        onPressed: !widget.canAddFile
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'NAV_BAR_FLOTING_COMP_add_ICN_ON_TAP');
                                if (widget.canAddFile) {
                                  logFirebaseEvent('IconButton_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: AddModalWidget(
                                            currentFolder: widget.currentFolder,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  return;
                                } else {
                                  return;
                                }
                              },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
