import '/backend/schema/structs/index.dart';
import '/components/buttons/tag_button/tag_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tags_list_model.dart';
export 'tags_list_model.dart';

class TagsListWidget extends StatefulWidget {
  const TagsListWidget({
    super.key,
    required this.tagsList,
  });

  final List<TagsStruct>? tagsList;

  @override
  State<TagsListWidget> createState() => _TagsListWidgetState();
}

class _TagsListWidgetState extends State<TagsListWidget>
    with TickerProviderStateMixin {
  late TagsListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsListModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final tags = widget.tagsList!.toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(tags.length, (tagsIndex) {
              final tagsItem = tags[tagsIndex];
              return TagButtonWidget(
                key: Key('Keyufw_${tagsIndex}_of_${tags.length}'),
                name: valueOrDefault<String>(
                  tagsItem.name,
                  'tag',
                ),
                color: tagsItem.color,
              );
            })
                .divide(SizedBox(width: 8.0))
                .addToStart(SizedBox(width: 16.0))
                .addToEnd(SizedBox(width: 16.0)),
          ),
        ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!);
      },
    );
  }
}
