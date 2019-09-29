class User {
  User(this._firstName, this._lastName);

  String _firstName;
  String _lastName;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get fullName => '$_firstName $_lastName';

  @override
  String toString() {
    return this.fullName;
  }
}
