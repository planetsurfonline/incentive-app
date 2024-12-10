import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/formatter/number_formatter.dart';

class IncentiveHistoryItem extends StatelessWidget {
  const IncentiveHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: mediumPadding),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 24,
            child: const Icon(
              Icons.arrow_downward_rounded,
              size: 24,
            ),
          ),
          const SizedBox(width: mediumPadding),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // TODO: Chage to use data from API / mock
                      'INV #30072002',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      // TODO: Chage to use data from API / mock
                      '+ Rp ${NumberFormatter.formatNumber(25000)}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                // TODO: Use date from API / mock
                const Text('9 Dec 2024')
              ],
            ),
          )
        ],
      ),
    );
  }
}
