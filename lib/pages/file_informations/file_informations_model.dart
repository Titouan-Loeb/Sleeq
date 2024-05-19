import '/backend/backend.dart';
import '/components/buttons/tags_list/tags_list_widget.dart';
import '/components/popups/add_tag_modal/add_tag_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'file_informations_widget.dart' show FileInformationsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FileInformationsModel extends FlutterFlowModel<FileInformationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for tagsList component.
  late TagsListModel tagsListModel;

  @override
  void initState(BuildContext context) {
    tagsListModel = createModel(context, () => TagsListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tagsListModel.dispose();
  }
}
