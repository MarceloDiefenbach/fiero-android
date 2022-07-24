import 'package:fiero/Classes/OwnerTeam.dart';

import 'Owner.dart';

class Team {
  String _id;
  String _name;
  OwnerTeam _owner;
  String _quickChallengeId;
  String _ownerId;
  String _createdAt;
  String _updatedAt;

  Team(this._id, this._name, this._owner, this._quickChallengeId, this._ownerId,
      this._createdAt, this._updatedAt);

  String get updatedAt => _updatedAt;

  set updatedAt(String value) {
    _updatedAt = value;
  }

  String get createdAt => _createdAt;

  set createdAt(String value) {
    _createdAt = value;
  }

  String get ownerId => _ownerId;

  set ownerId(String value) {
    _ownerId = value;
  }

  String get quickChallengeId => _quickChallengeId;

  set quickChallengeId(String value) {
    _quickChallengeId = value;
  }

  OwnerTeam get owner => _owner;

  set owner(OwnerTeam value) {
    _owner = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}