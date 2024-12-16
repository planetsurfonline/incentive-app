import 'package:flutter/material.dart';
import 'package:psm_incentive/shared/widgets/shimmer_placeholders.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class FilterSectionLoading extends StatelessWidget {
  const FilterSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: smallPadding,
      runSpacing: mediumSmallPadding,
      children: [
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 40,
            width: 150,
          ),
        ),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 40,
            width: 150,
          ),
        ),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiaryFixed,
          highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
          child: const BannerPlaceholder(
            height: 40,
            width: 150,
          ),
        ),
      ],
    );
  }
}
