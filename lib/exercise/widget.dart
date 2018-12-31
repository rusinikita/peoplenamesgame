import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';

class TextVariantsExerciseWidget extends StatefulWidget {
  final TextVariantsExercise exercise;

  const TextVariantsExerciseWidget({Key key, this.exercise}) : super(key: key);

  @override
  _TextVariantsExerciseState createState() =>
      _TextVariantsExerciseState(exercise);
}

class _TextVariantsExerciseState extends State<TextVariantsExerciseWidget> {
  TextVariantsExercise _exercise;
  String _userAnswer;

  _TextVariantsExerciseState(TextVariantsExercise exercise) {
    _exercise = exercise;
  }

  @override
  Widget build(BuildContext context) {
    final variants = _exercise.data.variants
        .map((variant) => Align(
              alignment: Alignment.centerLeft,
              child: Text(
                variant,
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Question'),
      ),
      body: Column(
        children: variants,
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
