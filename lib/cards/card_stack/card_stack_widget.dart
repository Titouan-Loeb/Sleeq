import '/backend/backend.dart';
import '/cards/card_constructor/card_constructor_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_stack_model.dart';
export 'card_stack_model.dart';

class CardStackWidget extends StatefulWidget {
  const CardStackWidget({
    super.key,
    required this.ref,
  });

  final List<DocumentReference>? ref;

  @override
  State<CardStackWidget> createState() => _CardStackWidgetState();
}

class _CardStackWidgetState extends State<CardStackWidget> {
  late CardStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardStackModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      height: 250.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final card = widget.ref!.toList();
          return FlutterFlowSwipeableStack(
            onSwipeFn: (index) {},
            onLeftSwipe: (index) {},
            onRightSwipe: (index) {},
            onUpSwipe: (index) {},
            onDownSwipe: (index) {},
            itemBuilder: (context, cardIndex) {
              final cardItem = card[cardIndex];
              return StreamBuilder<FilesRecord>(
                stream: FilesRecord.getDocument(cardItem),
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
                    key: Key('Key1xi_${cardIndex}_of_${card.length}'),
                    file: cardConstructorFilesRecord,
                  );
                },
              );
            },
            itemCount: card.length,
            controller: _model.swipeableStackController,
            loop: true,
            cardDisplayCount: 3,
            scale: 0.9,
          );
        },
      ),
    );
  }
}
