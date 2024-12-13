import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/shared/widgets/widgets.dart';
import 'package:psm_incentive/features/search/custom_search_bar.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:shimmer/shimmer.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    bool showPreviousLabel = true;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: BlocBuilder<IncentiveHistoryBloc, IncentiveHistoryState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
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

          // TODO: Please find better implementation
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                pinned: false,
                flexibleSpace: CustomSearchBar(
                  icon: const Icon(Icons.search),
                  hintText: 'Search',
                  onChanged: (text) {
                    context
                        .read<IncentiveHistoryBloc>()
                        .add(IncentiveHistoryFilterDisplay(searchQuery: text));
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: mediumSmallPadding,
                            ),
                            child: Text(
                              'Today',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF868E96)),
                            ),
                          ),
                          IncentiveHistoryItem(
                            invoiceNumber:
                                displayedHistories[index].invoiceNumber,
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
                              'Previously',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF868E96)),
                            ),
                          ),
                          IncentiveHistoryItem(
                            invoiceNumber:
                                displayedHistories[index].invoiceNumber,
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
                  childCount: displayedHistories.length,
                ),
              ),
            ],
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
