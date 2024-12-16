import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/shared/widgets/widgets.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:shimmer/shimmer.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    bool showPreviousLabel = true;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: BlocBuilder<IncentiveHistoryBloc, IncentiveHistoryState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            showPreviousLabel = true;
            return const _IncentiveHistoryLoading();
          }

          if (state.status == Status.error) {
            return Center(
              child: ErrorView(
                subtitle:
                    'Cannot load your incentive\'s history.\n Please try again',
                action: () {
                  context
                      .read<IncentiveHistoryBloc>()
                      .add(IncentiveHistoryGetHistoryData());
                },
                actionTitle: context.strings.tryAgain,
              ),
            );
          }

          if (state.allHistories.isEmpty) {
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

          final displayedHistories = state.displayedHistories;

          return ListView.builder(
            controller: scrollController,
            itemCount: state.displayedHistories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 64,
                        bottom: mediumSmallPadding,
                      ),
                      child: Text(
                        state.displayedHistories.length ==
                                state.allHistories.length
                            ? context.strings.todayLabel
                            : context.strings.resultLabel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF868E96)),
                      ),
                    ),
                    IncentiveHistoryItem(
                      invoiceNumber: displayedHistories[index].invoiceNumber,
                      invoiceDate: displayedHistories[index].invoiceDate,
                      amount: displayedHistories[index].amount,
                    ),
                  ],
                );
              }

              Widget child;

              if (showPreviousLabel) {
                child = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: mediumSmallPadding,
                      ),
                      child: Text(
                        context.strings.previouslyLabel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF868E96)),
                      ),
                    ),
                    IncentiveHistoryItem(
                      invoiceNumber: displayedHistories[index].invoiceNumber,
                      invoiceDate: displayedHistories[index].invoiceDate,
                      amount: displayedHistories[index].amount,
                    ),
                  ],
                );

                showPreviousLabel = false;
              } else {
                child = IncentiveHistoryItem(
                  invoiceNumber: displayedHistories[index].invoiceNumber,
                  invoiceDate: displayedHistories[index].invoiceDate,
                  amount: displayedHistories[index].amount,
                );
              }

              return child;
            },
          );

          // Seperated by each date
          // if (state.allHistories[index].invoiceDate != DateTimeX.today) {
          //   return Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //           vertical: mediumSmallPadding,
          //         ),
          //         child: Text(
          //           DateFormatter.getDate(
          //               state.allHistories[index].invoiceDate),
          //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //               fontWeight: FontWeight.w600,
          //               color: const Color(0xFF868E96)),
          //         ),
          //       ),
          //       IncentiveHistoryItem(
          //         invoiceNumber: state.allHistories[index].invoiceNumber,
          //         invoiceDate: state.allHistories[index].invoiceDate,
          //         amount: state.allHistories[index].amount,
          //       ),
          //     ],
          //   );
          // }

          // return null;
        },
      ),
    );
  }
}

class _IncentiveHistoryLoading extends StatelessWidget {
  const _IncentiveHistoryLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) => Column(
        children: [
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.tertiaryFixed,
            highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
            child: const BannerPlaceholder(
              height: 56,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: padding),
        ],
      ),
    );
  }
}
