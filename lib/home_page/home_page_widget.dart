import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_language_selector.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'v74sh12i' /* Page Title */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
              ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowLanguageSelector(
                width: 120,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                dropdownColor: FlutterFlowTheme.of(context).primaryBackground,
                dropdownIconColor: Color(0x0014181B),
                borderRadius: 20,
                textStyle: GoogleFonts.getFont(
                  'Lexend',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
                hideFlags: false,
                flagSize: 24,
                flagTextGap: 8,
                currentLanguage: FFLocalizations.of(context).languageCode,
                languages: FFLocalizations.languages(),
                onChanged: (lang) => setAppLanguage(context, lang),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.settings,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30,
                ),
                onPressed: () async {
                  context.pushNamed('Settings');
                },
              ),
            ],
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
    );
  }
}
