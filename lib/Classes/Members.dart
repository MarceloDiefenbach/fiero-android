import 'package:fiero/Classes/Teams.dart';

import 'Team.dart';

class Members {

  String _id;
  Team _team;
  double _score;
  String _userId;
  String _teamId;
  String _createdAt;
  String _updatedAt;

  Members(this._id, this._team, this._score, this._userId, this._teamId,
      this._createdAt, this._updatedAt);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Team get team => _team;

  set team(Team value) {
    _team = value;
  }

  double get score => _score;

  set score(double value) {
    _score = value.toDouble();
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get teamId => _teamId;

  set teamId(String value) {
    _teamId = value;
  }

  String get createdAt => _createdAt;

  set createdAt(String value) {
    _createdAt = value;
  }

  String get updatedAt => _updatedAt;

  set updatedAt(String value) {
    _updatedAt = value;
  }
}