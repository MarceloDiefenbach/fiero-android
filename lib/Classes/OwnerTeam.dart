class OwnerTeam {

  String _id;
  String _email;
  String _name;
  String _createdAt;
  String _updatedAt;

  OwnerTeam(this._id, this._email, this._name, this._createdAt, this._updatedAt);

  String get updateAt => _updatedAt;

  set updatedAt(String value) {
    _updatedAt = value;
  }

  String get createdAt => _createdAt;

  set createdAt(String value) {
    _createdAt = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}