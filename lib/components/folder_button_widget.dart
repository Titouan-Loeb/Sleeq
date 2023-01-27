import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FolderButtonWidget extends StatefulWidget {
  const FolderButtonWidget({
    Key? key,
    Color? color,
    String? name,
  })  : this.color = color ?? const Color(0xFFFF0000),
        this.name = name ?? 'folder',
        super(key: key);

  final Color color;
  final String name;

  @override
  _FolderButtonWidgetState createState() => _FolderButtonWidgetState();
}

class _FolderButtonWidgetState extends State<FolderButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 100,
              icon: Icon(
                Icons.folder_rounded,
                color: widget.color,
                size: 80,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
          Text(
            widget.name,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyText1Family),
                ),
          ),
        ],
      ),
    );
  }
}
