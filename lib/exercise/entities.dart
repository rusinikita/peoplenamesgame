class TextVariantsExercise extends Exercise<TextVariantsData, String> {
  const TextVariantsExercise({TextVariantsData data, String rightAnswer, String userAnswer, Rightness rightness}) : super(data, rightAnswer, userAnswer, rightness);
}

class Exercise<Data, Answer> {
  final Data data;
  final Answer rightAnswer;
  final Answer userAnswer;
  final Rightness rightness;

  const Exercise(this.data, this.rightAnswer, this.userAnswer, this.rightness);
}

enum Rightness { Right, Wrong, Partly }

class TextVariantsData {
  final String question;
  final String photoLink;
  final List<String> variants;

  const TextVariantsData({this.question, this.photoLink, this.variants});
}
