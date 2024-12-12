import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/pages/incentive_history/incentive_history_page.dart';
import 'package:psm_incentive/features/incentives/presentation/shared/widgets/widgets.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:shimmer/shimmer.dart';

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
                return const _RecentHistoryLoading();
              }

              if (state.status == Status.error) {
                return Expanded(
                  child: Center(
                    child: ErrorView(
                      title:
                          'Cannot load recent history data. Please try again',
                      actionTitle: context.strings.tryAgain,
                      action: () {
                        context
                            .read<IncentiveHistoryBloc>()
                            .add(IncentiveHistoryGetRecentData());
                      },
                    ),
                  ),
                );
              }

              if (state.recentHistories.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(top: extraLargePadding),
                  child: Center(
                    child: ErrorView(
                      subtitle: 'Your incentive history\nwill show up here',
                      icon: Icon(Icons.account_balance_wallet_outlined),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  ...state.recentHistories.map(
                    (history) => IncentiveHistoryItem(
                        invoiceNumber: history.invoiceNumber,
                        invoiceDate: history.invoiceDate,
                        amount: history.amount),
                  ),
                  if (state.recentHistories.isNotEmpty)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(IncentiveHistoryPage.route());
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

class _RecentHistoryLoading extends StatelessWidget {
  const _RecentHistoryLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: mediumPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: mediumPadding),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 56,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
