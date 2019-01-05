import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:peoplenames/people/entities.dart';

Future<List<Person>> getPeople() async {
  final String json = await rootBundle.loadString('assets/mock_people.json');
  return parsePeople(json);
}

List<Person> parsePeople(String people) {
  return json
      .decode(people)
      .map<Person>(
        (json) => Person(
              id: json['id'],
              photoLink: json['photoLink'],
              firstName: json['firstName'],
              lastName: json['lastName'],
              middleName: json['middleNamek'],
              profession: json['profession'],
              gender: parseGender(json['gender']),
            ),
      )
      .toList();
}

Gender parseGender(String gender) {
  switch (gender) {
    case 'male':
      return Gender.Male;
    case 'female':
      return Gender.Female;
    case 'helicopter':
      return Gender.Helocopter;
    default:
      return Gender.Other;
  }
}
