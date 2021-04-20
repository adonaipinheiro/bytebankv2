import 'package:bytebankv2/components/dashboard_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:bytebankv2/core/core.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  void _navigateToContactsList(BuildContext context) {
    Navigator.pushNamed(context, '/contacts');
  }

  void _navigateToTransferList(BuildContext context) {
    Navigator.pushNamed(context, '/transactions');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardButtonWidget(
                  'Contatos',
                  Icons.people,
                  onClick: () => _navigateToContactsList(context),
                ),
                DashboardButtonWidget(
                  'Extratos',
                  Icons.note,
                  onClick: () => _navigateToTransferList(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
