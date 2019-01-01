import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';
import 'package:peoplenames/exercise/moks.dart';
import 'package:peoplenames/exercise/text_variants_widget.dart';

class PeopleFlow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PeopleFlowState();
}

class _PeopleFlowState extends State<PeopleFlow> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Question'),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildExercise(),
          ),
          RaisedButton(
            onPressed: null,
            textTheme: ButtonTextTheme.primary,
            child: Text(
              'Next',
            ),
          )
        ],
      ),
    );
  }

  Widget buildExercise() {
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
      onExerciseAnswered: (answer) => {},
    );
  }
}
