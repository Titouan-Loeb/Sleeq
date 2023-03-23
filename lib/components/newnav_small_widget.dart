import '/auth/auth_util.dart';
import '/components/sleeq_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'newnav_small_model.dart';
export 'newnav_small_model.dart';

class NewnavSmallWidget extends StatefulWidget {
  const NewnavSmallWidget({Key? key}) : super(key: key);

  @override
  _NewnavSmallWidgetState createState() => _NewnavSmallWidgetState();
}

class _NewnavSmallWidgetState extends State<NewnavSmallWidget> {
  late NewnavSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewnavSmallModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: wrapWithModel(
            model: _model.sleeqLogoModel,
            updateCallback: () => setState(() {}),
            child: SleeqLogoWidget(
              color: FlutterFlowTheme.of(context).primaryText,
              withText: false,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: InkWell(
            onTap: () async {
              logFirebaseEvent('NEWNAV_SMALL_COMP_contentView_1_ON_TAP');
              if (('launch://sleeq.app${GoRouter.of(context).location}' !=
                      'launch://sleeq.app/homePage') ||
                  ('launch://sleeq.app${GoRouter.of(context).location}' !=
                      'launch://sleeq.app/')) {
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

                return;
              } else {
                return;
              }
            },
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(0.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                      child: Container(
                        width: 4.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                      'launch://sleeq.app/homePage') ||
                                  ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                      'launch://sleeq.app/')
                              ? FlutterFlowTheme.of(context).primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(4.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.home_filled,
                      color: ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                  'launch://sleeq.app/homePage') ||
                              ('launch://sleeq.app${GoRouter.of(context).location}' ==
                                  'launch://sleeq.app/')
                          ? FlutterFlowTheme.of(context).primaryColor
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: InkWell(
            onTap: () async {
              logFirebaseEvent('NEWNAV_SMALL_COMP_contentView_1_ON_TAP');
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
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                      child: Container(
                        width: 4.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            'launch://sleeq.app${GoRouter.of(context).location}' ==
                                    'launch://sleeq.app/settings'
                                ? FlutterFlowTheme.of(context).primaryColor
                                : Colors.transparent,
                            FlutterFlowTheme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(4.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.settings,
                      color:
                          'launch://sleeq.app${GoRouter.of(context).location}' ==
                                  'launch://sleeq.app/settings'
                              ? FlutterFlowTheme.of(context).primaryColor
                              : FlutterFlowTheme.of(context).secondaryText,
                      size: 28.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'f2b85cbh' /* Upload a file */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              color: Colors.white,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle2Family),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                            imageUrl: currentUserPhoto != null &&
                                    currentUserPhoto != ''
                                ? currentUserPhoto
                                : 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Default_pfp.svg',
                            width: 44.0,
                            height: 44.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
