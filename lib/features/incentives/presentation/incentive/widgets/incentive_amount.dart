import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/features/incentives/presentation/incentive/bloc/incentive_bloc.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:psm_incentive/utils/formatter/number_formatter.dart';

class IncentiveAmount extends StatelessWidget {
  const IncentiveAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Incentives',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: mediumSmallPadding,
                    ),
                    child: Text(
                      'Rp',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  BlocBuilder<IncentiveBloc, IncentiveState>(
                    builder: (context, state) {
                      if (state.status == Status.loading) {
                        // TODO: Create shimmer loading
                        return CircularProgressIndicator(
                          color: context.customColor?.invertedProgressColor,
                        );
                      }

                      return Text(
                        // TODO: Change to use data from API
                        NumberFormatter.formatNumber(state.incentiveAmount),
                        style: GoogleFonts.inter(fontSize: 48),
                      );
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // TODO: Implement show/hide
                },
                icon: const Icon(Icons.visibility),
              )
            ],
          )
        ],
      ),
    );
  }
}
