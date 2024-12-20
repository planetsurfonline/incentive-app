import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/formatter/date_formatter.dart';
import 'package:psm_incentive/utils/formatter/number_formatter.dart';

class IncentiveHistoryItem extends StatelessWidget {
  final String invoiceNumber;
  final DateTime invoiceDate;
  final double amount;

  const IncentiveHistoryItem({
    super.key,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.amount,
  });

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
                    Flexible(
                      child: Text(
                        // TODO: Chage to use data from API
                        invoiceNumber,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: padding),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, settingState) {
                        return Text(
                          // TODO: Chage to use data from API
                          '+ Rp ${settingState.showNominal ? NumberFormatter.formatNumber(amount) : '******'}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        );
                      },
                    )
                  ],
                ),
                // TODO: Use date from API
                Text(DateFormatter.getShortDate(invoiceDate))
              ],
            ),
          )
        ],
      ),
    );
  }
}
