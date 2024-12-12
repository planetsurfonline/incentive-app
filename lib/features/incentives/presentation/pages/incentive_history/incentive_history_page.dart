import 'package:flutter/material.dart';

class IncentiveHistoryPage extends StatelessWidget {
  const IncentiveHistoryPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const IncentiveHistoryPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incentive Logging'),
      ),
    );
  }
}
