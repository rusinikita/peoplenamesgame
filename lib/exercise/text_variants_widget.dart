import 'package:flutter/material.dart';
import 'package:peoplenames/exercise/entities.dart';

class TextVariantsExerciseWidget extends StatelessWidget {
  final TextVariantsExercise exercise;
  final void Function(String) onExerciseAnswered;

  const TextVariantsExerciseWidget(
      {Key key, this.exercise, this.onExerciseAnswered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    List<Widget> variants = exercise.data.variants
        .map((variant) => _buildAnswerVariandWidget(variant, theme))
        .toList();

    return Column(
      children: [
        Image.network(
          exercise.data.photoLink,
          height: 250,
        ),
        Padding(
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
      ],
    );
  }

  Widget _buildAnswerVariandWidget(String text, ThemeData theme) {
    final rightnessColor = text == exercise.rightAnswer
        ? Color.fromARGB(255, 0, 255, 0)
        : Color.fromARGB(255, 255, 0, 0);
    final shouldColorRow = exercise.userAnswer != null &&
        (exercise.userAnswer == text || text == exercise.rightAnswer);
    final decoration =
        shouldColorRow ? BoxDecoration(color: rightnessColor) : null;

    return InkWell(
      onTap: exercise.rightness == null ? () => onExerciseAnswered(text) : null,
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
