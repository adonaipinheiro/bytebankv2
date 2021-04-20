class Contact {
  final int id;
  final String _name;
  final int _accountNumber;

  Contact(
    this._name,
    this._accountNumber, {
    this.id,
  });

  int getId() {
    return this.id;
  }

  String getName() {
    return this._name;
  }

  int getAccountNumber() {
    return this._accountNumber;
  }

  @override
  String toString() {
    return '{id: $id, name: $_name, accountNumber: $_accountNumber}';
  }
}
