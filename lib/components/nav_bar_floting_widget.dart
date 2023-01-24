import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({Key? key}) : super(key: key);

  @override
  _NavBarFlotingWidgetState createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
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
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 100,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
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
    );
  }
}
