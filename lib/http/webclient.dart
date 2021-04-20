import 'dart:convert';
import 'package:bytebankv2/models/contact.dart';
import 'package:bytebankv2/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    debugPrint(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    debugPrint(data.toString());
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final List<Transaction> transactions = [];

  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  final Response response = await client
      .get(Uri.parse("http://192.168.15.115:8080/transactions"))
      .timeout(Duration(seconds: 5));

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
