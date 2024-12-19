import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';
import 'package:psm_incentive/features/members/domain/models.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:psm_incentive/utils/formatter/number_formatter.dart';

class MemberListItem extends StatelessWidget {
  const MemberListItem({
    super.key,
    required this.member,
  });

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: mediumSmallPadding),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.customColor?.borderColor,
            child: Text(
              member.nameInitials,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: padding),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.fullname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${member.jobRole.label} - ${member.store.storeName}',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: padding),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    var amount = NumberFormatter.formatNumber(
                      member.incentive.amount,
                    );

                    if (!state.showNominal) amount = '******';

                    return Text('Rp $amount');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
