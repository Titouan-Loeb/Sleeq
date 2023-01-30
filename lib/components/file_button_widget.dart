import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FileButtonWidget extends StatefulWidget {
  const FileButtonWidget({
    Key? key,
    this.fileUrl,
    this.name,
    this.color,
  }) : super(key: key);

  final String? fileUrl;
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
          onPressed: () {
            print('IconButton pressed ...');
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
