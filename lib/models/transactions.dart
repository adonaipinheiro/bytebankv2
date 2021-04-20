import 'contact.dart';

class Transaction {
  final double _value;
  final Contact _contact;

  Transaction(
    this._value,
    this._contact,
  );

  double getValue() {
    return this._value;
  }

  Contact getContact() {
    return this._contact;
  }

  @override
  String toString() {
    return 'Transaction{value: $_value, contact: $_contact}';
  }
}
