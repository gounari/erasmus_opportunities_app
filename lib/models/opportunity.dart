import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

List<String> images = [
  'assets/images/happy_people0.jpg',
  'assets/images/happy_people1.jpg',
  'assets/images/happy_people2.jpg',
  'assets/images/happy_people3.jpg',
  'assets/images/happy_people4.jpg',
];

class Opportunity {
  final String oid;
  String title;
  String organisationName;
  final String organisationUID;
  String venueLocation;
  String type;
  DateTime startDate;
  DateTime endDate;
  int lowAge;
  int highAge;
  String topic;
  DateTime applicationDeadline;
  double participationCost;
  double reimbursementLimit;
  String applicationLink;
  String provideForDisabilities;
  String description;
  String image;

  Opportunity({
    @required this.oid,
    @required this.title,
    @required this.organisationName,
    @required this.organisationUID,
    @required this.venueLocation,
    @required this.type,
    @required this.startDate,
    @required this.endDate,
    @required this.lowAge,
    @required this.highAge,
    @required this.topic,
    @required this.applicationDeadline,
    @required this.participationCost,
    @required this.reimbursementLimit,
    @required this.applicationLink,
    @required this.provideForDisabilities,
    @required this.description,
    this.image,
  }){
    if (image == null) {
      image = randomChoice(images);
    }
  }
}

List<Opportunity> opportunities = [
  Opportunity(
    oid: 'adhagdgahgdhagdhagdh',
    title: 'One',
    organisationName: 'Venice',
    organisationUID: 'Italy',
    venueLocation: 'Italy',
    type: 'Italy',
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    lowAge: 20,
    highAge: 30,
    topic: 'Italy',
    applicationDeadline: DateTime.now(),
    participationCost: 50,
    reimbursementLimit: 250,
    applicationLink: 'Italy',
    provideForDisabilities: 'Italy',
    description: 'Italy',
  ),
  Opportunity(
    oid: 'jahdjhajdhajhdja',
    title: 'Two',
    organisationName: 'Venice',
    organisationUID: 'Italy',
    venueLocation: 'Italy',
    type: 'Italy',
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    lowAge: 20,
    highAge: 30,
    topic: 'Italy',
    applicationDeadline: DateTime.now(),
    participationCost: 50,
    reimbursementLimit: 250,
    applicationLink: 'Italy',
    provideForDisabilities: 'Italy',
    description: 'Italy',
  ),
];