import 'package:flutter/material.dart';

import 'package:bytebankv2/core/core.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  void navigateToContactList(context) {
    Navigator.pushNamed(context, '/contacts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                AppImages.logo,
                width: double.maxFinite,
                alignment: Alignment.center,
              ),
            ),
            Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: () {
                  navigateToContactList(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
