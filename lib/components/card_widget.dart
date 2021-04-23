import 'package:bytebankv2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  ContactItem(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
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
