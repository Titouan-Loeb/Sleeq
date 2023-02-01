import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FileButtonWidget extends StatefulWidget {
  const FileButtonWidget({
    Key? key,
    this.file,
    this.name,
    this.color,
  }) : super(key: key);

  final FileRecord? file;
  final String? name;
  final Color? color;

  @override
  _FileButtonWidgetState createState() => _FileButtonWidgetState();
}

class _FileButtonWidgetState extends State<FileButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 100,
          icon: FaIcon(
            FontAwesomeIcons.solidFileAlt,
            color: widget.color,
            size: 80,
          ),
          onPressed: () async {
            logFirebaseEvent('FILE_BUTTON_COMP_solidFileAlt_ICN_ON_TAP');

            context.pushNamed(
              'file',
              queryParams: {
                'file': serializeParam(
                  widget.file,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'file': widget.file,
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 200),
                ),
              },
            );
          },
        ),
        Text(
          widget.name!,
          maxLines: 2,
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Lexend',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                lineHeight: 1,
              ),
        ),
      ],
    );
  }
}
