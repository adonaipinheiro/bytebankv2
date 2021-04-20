import 'package:bytebankv2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.getName(),
          style: TextStyle(fontSize: 22),
        ),
        subtitle: Text(
          contact.getAccountNumber().toString(),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
