import 'dart:convert';
import 'package:bytebankv2/models/contact.dart';
import 'package:bytebankv2/models/transactions.dart';
import 'package:http/http.dart';
import 'package:bytebankv2/http/webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final List<Transaction> transactions = [];

    final Response response =
        await client.get(Uri.parse(baseUrl)).timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);
    for (Map<String, dynamic> element in decodedJson) {
      transactions.add(
        Transaction(
          element['value'],
          Contact(
            element['contact']['name'],
            element['contact']['accountNumber'],
          ),
        ),
      );
    }

    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.getValue(),
      'contact': {
        'name': transaction.getContact().getName(),
        'accountNumber': transaction.getContact().getAccountNumber()
      }
    };

    final String transactionJson = jsonEncode(transactionMap);

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    Map<String, dynamic> json = jsonDecode(response.body);

    final Transaction transactionResponse = Transaction(
      json['value'],
      Contact(
        json['contact']['name'],
        json['contact']['accountNumber'],
      ),
    );

    return transactionResponse;
  }
}
