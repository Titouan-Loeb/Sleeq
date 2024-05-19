import '/backend/backend.dart';
import '/cards/card_constructor/card_constructor_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_slider_model.dart';
export 'card_slider_model.dart';

class CardSliderWidget extends StatefulWidget {
  const CardSliderWidget({
    super.key,
    required this.cards,
  });

  final List<DocumentReference>? cards;

  @override
  State<CardSliderWidget> createState() => _CardSliderWidgetState();
}

class _CardSliderWidgetState extends State<CardSliderWidget> {
  late CardSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardSliderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.cards?.length != 0,
      child: Builder(
        builder: (context) {
          final cardRef = widget.cards!.toList();
          return Container(
            width: double.infinity,
            height: 230.0,
            child: CarouselSlider.builder(
              itemCount: cardRef.length,
              itemBuilder: (context, cardRefIndex, _) {
                final cardRefItem = cardRef[cardRefIndex];
                return StreamBuilder<FilesRecord>(
                  stream: FilesRecord.getDocument(cardRefItem),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: SpinKitChasingDots(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 70.0,
                          ),
                        ),
                      );
                    }
                    final cardConstructorFilesRecord = snapshot.data!;
                    return CardConstructorWidget(
                      key: Key('Keyexs_${cardRefIndex}_of_${cardRef.length}'),
                      file: cardConstructorFilesRecord,
                    );
                  },
                );
              },
              carouselController: _model.carouselController ??=
                  CarouselController(),
              options: CarouselOptions(
                initialPage: max(0, min(1, cardRef.length - 1)),
                viewportFraction: 1.0,
                disableCenter: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                enableInfiniteScroll: false,
                scrollDirection: Axis.vertical,
                autoPlay: false,
                onPageChanged: (index, _) =>
                    _model.carouselCurrentIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
