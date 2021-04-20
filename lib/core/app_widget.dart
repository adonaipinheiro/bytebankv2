import 'package:flutter/material.dart';

import 'package:bytebankv2/screens/contacts/new_contact_page.dart';
import 'package:bytebankv2/screens/transactions/transactions_list.dart';
import 'package:bytebankv2/screens/contacts/contacts_page.dart';
import 'package:bytebankv2/screens/dashboard/dashboard_page.dart';

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.green,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/contacts': (context) => ContactsList(),
        '/new_contact': (context) => ContactForm(),
        '/transactions': (context) => TransactionsList(),
      },
    );
  }
}
