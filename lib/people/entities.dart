class Person {
  final num id;
  final String photoLink;
  final String firstName;
  final String lastName;
  final String middleName;
  final String profession;
  final Gender gender;

  Person({this.id, this.photoLink, this.firstName, this.lastName, this.middleName, this.profession, this.gender});
}

enum Gender {
  Male, Female, Other, Helocopter
}