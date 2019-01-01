import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';
import 'package:peoplenames/exercise/moks.dart';
import 'package:peoplenames/exercise/text_variants_widget.dart';

class PeopleNamesFlow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PeopleNamesFlowState();
}

class _PeopleNamesFlowState extends State<PeopleNamesFlow> {
  Exercise current;
  Queue<Exercise> exercises;

  void _next() {}

  @override
  void initState() {
    exercises = Queue.of(mockList);
    current = exercises.removeFirst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (current.runtimeType) {
      case TextVariantsExercise:
        return buildTextVariantsExercise(current);
        break;
      default:
        return null;
    }
  }

  Widget buildTextVariantsExercise(TextVariantsExercise exercise) {
    return TextVariantsExerciseWidget(
      key: Key(exercise.toString()),
      exercise: exercise,
    );
  }
}
