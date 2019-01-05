import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';
import 'package:peoplenames/exercise/moks.dart';
import 'package:peoplenames/exercise/text_variants_widget.dart';
import 'package:peoplenames/games/people_exercises_generator.dart';
import 'package:peoplenames/people/people_repository.dart';

class PeopleFlow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PeopleFlowState();
}

class _PeopleFlowState extends State<PeopleFlow> {
  Exercise current;
  bool isLoading = false;
  Error error;
  final Queue<Exercise> exercises = Queue();

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

      if (exercises.length < 3) {
        loadExercises();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    loadExercises(isInitial: true).then((_) {});
  }

  Future loadExercises({bool isInitial = false}) async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });
      final generated = await getExercisesFromPeople();
      setState(() {
        exercises.addAll(generated);
        isLoading = false;
        if (isInitial) {
          current = exercises.removeFirst();
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
        error = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (error != null) {
      return Center(child: Text('Error'));
    } else {
      return Column(
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
      );
    }
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

Future<List<Exercise>> getExercisesFromPeople() async {
  final people = await getPeople();
  return generateExercises(people);
}
