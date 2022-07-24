import 'package:fiero/Classes/Owner.dart';

import 'Members.dart';

class Teams {

  String _id;
  String _name;
  Owner _owner;
  String _quickChallengeId;
  String _ownerId;
  String _createdAt;
  String _updatedAt;
  List<Members> _members;

  Teams(this._id, this._name, this._owner, this._quickChallengeId, this._ownerId,
      this._createdAt, this._updatedAt, this._members);

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

  Owner get owner => _owner;

  set owner(Owner value) {
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

  List<Members> get members => _members;

  set members(List<Members> value) {
    _members = value;
  }
}