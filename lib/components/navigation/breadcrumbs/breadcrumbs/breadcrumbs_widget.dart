import '/components/navigation/breadcrumbs/sub_elements/bead_crumbs_back_button/bead_crumbs_back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'breadcrumbs_model.dart';
export 'breadcrumbs_model.dart';

class BreadcrumbsWidget extends StatefulWidget {
  const BreadcrumbsWidget({
    super.key,
    this.folderNames,
    bool? allowGoBack,
  }) : this.allowGoBack = allowGoBack ?? true;

  final List<String>? folderNames;
  final bool allowGoBack;

  @override
  State<BreadcrumbsWidget> createState() => _BreadcrumbsWidgetState();
}

class _BreadcrumbsWidgetState extends State<BreadcrumbsWidget> {
  late BreadcrumbsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreadcrumbsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            if (widget.allowGoBack)
              wrapWithModel(
                model: _model.beadCrumbsBackButtonModel,
                updateCallback: () => setState(() {}),
                child: BeadCrumbsBackButtonWidget(),
              ),
            if (!widget.allowGoBack)
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.home_filled,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
          ],
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 35.0,
              child: custom_widgets.Breadcrumbs(
                width: double.infinity,
                height: 35.0,
                folderList: widget.folderNames!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
