import 'package:bytebankv2/database/dao/contact_dao.dart';
import 'package:bytebankv2/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactForm extends StatefulWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDAO _contactDAO = ContactDAO();

  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  void createNewContact() {
    final String name = widget._nameController.text;
    final int accountNumber = int.tryParse(widget._accountController.text);
    final Contact contact = new Contact(name, accountNumber);
    widget._contactDAO.save(contact).then((id) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: widget._nameController,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                ),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: widget._accountController,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    createNewContact();
                  },
                  child: Text('Criar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
