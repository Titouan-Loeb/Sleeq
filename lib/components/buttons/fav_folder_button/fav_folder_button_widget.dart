import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fav_folder_button_model.dart';
export 'fav_folder_button_model.dart';

class FavFolderButtonWidget extends StatefulWidget {
  const FavFolderButtonWidget({
    super.key,
    required this.previousFolderNames,
  });

  final List<String>? previousFolderNames;

  @override
  State<FavFolderButtonWidget> createState() => _FavFolderButtonWidgetState();
}

class _FavFolderButtonWidgetState extends State<FavFolderButtonWidget> {
  late FavFolderButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavFolderButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          child: Stack(
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 15.0,
                buttonSize: 100.0,
                icon: Icon(
                  Icons.favorite,
                  color: FlutterFlowTheme.of(context).customColor3,
                  size: 80.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('FAV_FOLDER_BUTTON_favorite_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('favorites');
                },
              ),
            ],
          ),
        ),
        Text(
          FFLocalizations.of(context).getText(
            '2zmq6vhp' /* Favorites */,
          ),
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ],
    );
  }
}
