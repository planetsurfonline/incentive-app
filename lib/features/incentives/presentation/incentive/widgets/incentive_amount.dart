import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/features/incentives/presentation/incentive/bloc/incentive_bloc.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/shimmer_placeholders.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/formatter/number_formatter.dart';
import 'package:shimmer/shimmer.dart';

class IncentiveAmount extends StatelessWidget {
  const IncentiveAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Incentives',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            BlocBuilder<IncentiveBloc, IncentiveState>(
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const _IncentiveLoading();
                }

                return Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: largeMediumPadding,
                        ),
                        child: Text(
                          'Rp',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          // TODO: Change to use data from API
                          state.incentiveAmount == 0
                              ? '0,00'
                              : NumberFormatter.formatNumber(
                                  state.incentiveAmount),
                          style: GoogleFonts.inter(fontSize: 48),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: Implement show/hide
                        },
                        icon: const Icon(Icons.visibility),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _IncentiveLoading extends StatelessWidget {
  const _IncentiveLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: smallPadding,
      ),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.tertiaryFixed,
        highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
        child: const BannerPlaceholder(
          height: 60,
          width: double.infinity,
        ),
      ),
    );
  }
}
