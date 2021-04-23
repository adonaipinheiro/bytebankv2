import 'package:bytebankv2/components/card_widget.dart';
import 'package:bytebankv2/database/dao/contact_dao.dart';
import 'package:bytebankv2/models/contact.dart';
import 'package:bytebankv2/screens/transactions/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  final ContactDAO _contactDAO = ContactDAO();

  @override
  State<StatefulWidget> createState() {
    return _ContactListState();
  }
}

class _ContactListState extends State<ContactsList> {
  void navigateToCreateNewContact(context) {
    Navigator.pushNamed(context, '/new_contact')
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => widget._contactDAO.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Error');
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Carregando...'),
                    ),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              return Text('Error');
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, id) {
                  final Contact contact = contacts[id];
                  return ContactItem(
                    contact,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Erro');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToCreateNewContact(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
