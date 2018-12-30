class TextVariantsExercise extends Exercise<TextVariantsData, String> {
  TextVariantsExercise(TextVariantsData data, String answer, Rightness rightness) : super(data, answer, rightness);
}

class Exercise<Data, Answer> {
  final Data data;
  final Answer answer;
  final Rightness rightness;

  Exercise(this.data, this.answer, this.rightness);
}

enum Rightness { Right, Wrong, Partly }

class TextVariantsData {
  final String question;
  final String photoLink;
  final List<String> variants;

  TextVariantsData(this.question, this.photoLink, this.variants);
}
