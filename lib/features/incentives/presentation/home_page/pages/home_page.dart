import 'package:flutter/material.dart';
import 'package:psm_incentive/features/incentives/presentation/home_page/widgets/incentive_amount.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.homeLabel),
        actions: [
          IconButton(
            onPressed: () async {
              // TODO: Change if needed
              await Supabase.instance.client.auth.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: const Column(
        children: [
          IncentiveAmount(),
          Divider(),
        ],
      ),
    );
  }
}
