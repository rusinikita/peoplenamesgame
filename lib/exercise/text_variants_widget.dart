import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';

class TextVariantsExerciseWidget extends StatefulWidget {
  final TextVariantsExercise exercise;
  final void Function(Rightness) onExerciseFinished;

  const TextVariantsExerciseWidget(
      {Key key, this.exercise, this.onExerciseFinished})
      : super(key: key);

  @override
  _TextVariantsExerciseState createState() => _TextVariantsExerciseState();
}

class _TextVariantsExerciseState extends State<TextVariantsExerciseWidget> {
  String _userAnswer;
  Rightness _rightness;

  void _onAnswerClick(String answer) {
    setState(() {
      _userAnswer = answer;
      _rightness = Rightness.Right;
    });
  }

  void _onNextClick() {
    setState(() {
      _userAnswer = null;
      _rightness = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final exercise = widget.exercise;

    List<Widget> variants = exercise.data.variants
        .map((variant) => _buildAnswerVariandWidget(variant))
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
            onPressed: _rightness == null ? null : _onNextClick,
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

  Widget _buildAnswerVariandWidget(String text) {
    final theme = Theme.of(context);
    final exercise = widget.exercise;
    final rightnessColor = text == exercise.rightAnswer
        ? Color.fromARGB(255, 0, 255, 0)
        : Color.fromARGB(255, 255, 0, 0);
    final shouldColorRow = _userAnswer != null && (_userAnswer == text || text == exercise.rightAnswer);
    final decoration =  shouldColorRow ? BoxDecoration(color: rightnessColor) : null;

    return InkWell(
      onTap: _rightness == null ? () => _onAnswerClick(text) : null,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(
          text,
          style: theme.textTheme.headline,
        ),
        decoration: decoration,
      ),
    );
  }
}
