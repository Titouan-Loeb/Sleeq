import '/components/subscription/feature_description/feature_description_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_premium_plan_sleeq_family_model.dart';
export 'new_premium_plan_sleeq_family_model.dart';

class NewPremiumPlanSleeqFamilyWidget extends StatefulWidget {
  const NewPremiumPlanSleeqFamilyWidget({super.key});

  @override
  State<NewPremiumPlanSleeqFamilyWidget> createState() =>
      _NewPremiumPlanSleeqFamilyWidgetState();
}

class _NewPremiumPlanSleeqFamilyWidgetState
    extends State<NewPremiumPlanSleeqFamilyWidget> {
  late NewPremiumPlanSleeqFamilyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewPremiumPlanSleeqFamilyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/sleeq_family.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '9hb7xi06' /* Sleeq Family */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleLargeFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'uqoa29gh' /* All unlocked for 4 family memb... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '2yqvp0ak' /* 14,99€ */,
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 15.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9u017lif' /* Storage */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
                          ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.featureDescriptionModel1,
                    updateCallback: () => setState(() {}),
                    child: FeatureDescriptionWidget(
                      title: FFLocalizations.of(context).getText(
                        'y65ak6we' /* Max upload size */,
                      ),
                      description: 'Your are not limited in file size',
                      value: '∞',
                      strikethrought: false,
                      icon: Icon(
                        Icons.not_interested,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      useIcon: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.featureDescriptionModel2,
                    updateCallback: () => setState(() {}),
                    child: FeatureDescriptionWidget(
                      title: FFLocalizations.of(context).getText(
                        'ay8emwu5' /* Total storage */,
                      ),
                      description: 'Your total storage space available',
                      value: '10x4 Go',
                      strikethrought: false,
                      icon: Icon(
                        Icons.not_interested,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      useIcon: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'oiauic8r' /* Features */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
                          ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.featureDescriptionModel3,
                    updateCallback: () => setState(() {}),
                    child: FeatureDescriptionWidget(
                      title: FFLocalizations.of(context).getText(
                        'mzsqkh52' /* Optical Charactere Recognition... */,
                      ),
                      description: FFLocalizations.of(context).getText(
                        'zm4vmf2q' /* Benefit from our OCR to find y... */,
                      ),
                      value: '',
                      strikethrought: false,
                      icon: Icon(
                        Icons.find_in_page_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      useIcon: true,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.featureDescriptionModel4,
                    updateCallback: () => setState(() {}),
                    child: FeatureDescriptionWidget(
                      title: FFLocalizations.of(context).getText(
                        'hbwsymq3' /* Add document in wallet */,
                      ),
                      description: 'Add your documents in your native wallet',
                      value: '',
                      strikethrought: false,
                      icon: Icon(
                        Icons.wallet_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      useIcon: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
