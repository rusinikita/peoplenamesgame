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

  void handleAnswer(dynamic answer) {
    setState(() {
      final rightness =
          answer == current.rightAnswer ? Rightness.Right : Rightness.Wrong;

      current = TextVariantsExercise(
          data: current.data,
          rightAnswer: current.rightAnswer,
          userAnswer: answer,
          rightness: rightness);
    });
  }

  void next() {
    setState(() {
      current = exercises.removeFirst();

      if (exercises.length == 0) {
        exercises.addAll(mockList);
      }
    });
  }

  @override
  void initState() {
    exercises = Queue.of(mockList);
    current = exercises.removeFirst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: buildExercise(),
          ),
          RaisedButton(
            onPressed: current.rightness != null ? next : null,
            color: Theme.of(context).primaryColor,
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
      exercise: exercise,
      onExerciseAnswered: handleAnswer,
    );
  }
}
