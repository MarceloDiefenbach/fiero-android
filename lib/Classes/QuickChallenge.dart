import 'Owner.dart';
import 'Teams.dart';

class QuickChallenge {

  String _id;
  String _name;
  String _invitationCode;
  String _type;
  double _goal;
  String _goalMeasure;
  bool _finished;
  String _ownerId;
  String _createdAt;
  String _updatedAt;
  List<Teams> _teams;
  Owner _owner;

  QuickChallenge(
      this._id,
      this._name,
      this._invitationCode,
      this._type,
      this._goal,
      this._goalMeasure,
      this._finished,
      this._ownerId,
      this._createdAt,
      this._updatedAt,
      this._teams,
      this._owner);

  Owner get owner => _owner;

  set owner(Owner value) {
    _owner = value;
  }

  List<Teams> get team => _teams;

  set team(List<Teams> value) {
    _teams = value;
  }

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

  bool get finished => _finished;

  set finished(bool value) {
    _finished = value;
  }

  String get goalMeasure => _goalMeasure;

  set goalMeasure(String value) {
    _goalMeasure = value;
  }

  double get goal => _goal;

  set goal(double value) {
    _goal = value.toDouble();
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  String get invitationCode => _invitationCode;

  set invitationCode(String value) {
    _invitationCode = value;
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
