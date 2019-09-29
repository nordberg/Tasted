class Restaurant {
  Restaurant(this._name);

  String _name;

  String get name => _name;

  @override
  String toString() {
    return this._name;
  }
}
