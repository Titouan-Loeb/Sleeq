import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popups/sub_elements/color_dial/color_dial_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_tag_modal_widget.dart' show AddTagModalWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTagModalModel extends FlutterFlowModel<AddTagModalWidget> {
  ///  Local state fields for this component.

  int addSelect = 1;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for ColorDial component.
  late ColorDialModel colorDialModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for ColorDial component.
  late ColorDialModel colorDialModel2;

  @override
  void initState(BuildContext context) {
    colorDialModel1 = createModel(context, () => ColorDialModel());
    colorDialModel2 = createModel(context, () => ColorDialModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    colorDialModel1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    colorDialModel2.dispose();
  }
}
