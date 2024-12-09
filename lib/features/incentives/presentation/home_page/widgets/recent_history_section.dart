import 'package:flutter/material.dart';
import 'package:psm_incentive/features/incentives/presentation/shared/widgets/incentive_history_item.dart';
import 'package:psm_incentive/utils/constants.dart';

class RecentHistorySection extends StatelessWidget {
  const RecentHistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent History',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF868E96),
                ),
          ),
          const IncentiveHistoryItem(),
          const IncentiveHistoryItem(),
          const IncentiveHistoryItem(),
          const IncentiveHistoryItem(),
          const IncentiveHistoryItem(),
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Change to navigate to history page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('History Page WIP')),
                );
              },
              child: const Text(
                'Show All',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
