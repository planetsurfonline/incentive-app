import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/shared/widgets/widgets.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

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
          BlocBuilder<IncentiveHistoryBloc, IncentiveHistoryState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                // TODO: Create shimmer loading for 5 item
                return Center(
                  child: CircularProgressIndicator(
                    color: context.customColor?.invertedProgressColor,
                  ),
                );
              }

              if (state.status == Status.error) {
                return Center(
                  child: ErrorView(
                    title: 'Cannot load recent history data. Please try again',
                    actionTitle: context.strings.tryAgain,
                    action: () {
                      context
                          .read<IncentiveHistoryBloc>()
                          .add(IncentiveHistoryGetRecentData());
                    },
                  ),
                );
              }

              if (state.recentHistories.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: Text('You don\'t have any history record'),
                  ),
                );
              }

              return Column(
                children: [
                  ...state.recentHistories.map(
                    (history) => IncentiveHistoryItem(
                        invoiceNumber: history.invoiceNumber,
                        invoiceDate: history.invoiceDate,
                        incentiveAmount: history.incentiveAmount),
                  ),
                  if (state.recentHistories.isNotEmpty)
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
              );
            },
          ),
        ],
      ),
    );
  }
}
