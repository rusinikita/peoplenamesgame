import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';

class TextVariantsExerciseWidget extends StatefulWidget {
  final TextVariantsExercise exercise;

  const TextVariantsExerciseWidget({Key key, this.exercise}) : super(key: key);

  @override
  _TextVariantsExerciseState createState() => _TextVariantsExerciseState();
}

class _TextVariantsExerciseState extends State<TextVariantsExerciseWidget> {
  String _userAnswer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final exercise = widget.exercise;

    List<Widget> variants = exercise.data.variants
        .map((variant) => _buildAnswerVariandWidget(variant, context))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Question'),
      ),
      body: Column(
        children: [
          Image.network(
            exercise.data.photoLink,
            height: 250,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              exercise.data.question,
              style: theme.textTheme.headline,
            ),
          ),
          Expanded(
            child: Column(
              children: variants,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          RaisedButton(
            onPressed: () => null,
            color: theme.primaryColor,
            textTheme: ButtonTextTheme.primary,
            child: Text(
              'Next',
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildAnswerVariandWidget(String text, BuildContext context) => InkWell(
      onTap: () => null,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
