import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class FilterItemHeader extends StatelessWidget {
  const FilterItemHeader({super.key, required this.title, this.onSeeAll});

  final String title;
  final Function()? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: onSeeAll == null ? mediumPadding : 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              if (onSeeAll != null)
                TextButton(
                  onPressed: onSeeAll,
                  child: Text(
                    context.strings.seeAllLabel,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
