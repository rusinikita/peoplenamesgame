import 'package:peoplenames/exercise/entities.dart';
import 'package:peoplenames/people/entities.dart';

List<Exercise> generateExercises(List<Person> people) {
  final allNames = people.map((person) => _getPersonFullName(person)).toList();

  return people.map<Exercise>((person) {
    allNames.shuffle();

    final personName = _getPersonFullName(person);
    final variants = allNames.sublist(0, 3);
    if (variants.contains(personName)) {
      variants.removeLast();
      variants.add(personName);
      variants.shuffle();
    }

    return TextVariantsExercise(
      data: TextVariantsData(
        photoLink: person.photoLink,
        question: 'Кто это?',
        variants: variants,
      ),
      rightAnswer: personName,
    );
  });
}

String _getPersonFullName(Person person) =>
    person.firstName + ' ' + person.lastName;
