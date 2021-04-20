import 'package:bytebankv2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDAO {
  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase(ContactDAO.tableSQL);
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final List<Contact> contacts = [];
    final Database db = await createDatabase(ContactDAO.tableSQL);
    await _toList(db, contacts);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.getName();
    contactMap[_accountNumber] = contact.getAccountNumber();
    return contactMap;
  }

  Future _toList(Database db, List<Contact> contacts) async {
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_name],
        row[_accountNumber],
        id: row[_id],
      );
      contacts.add(contact);
    }
  }
}
