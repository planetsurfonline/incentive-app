import 'package:flutter/material.dart';
import 'package:psm_incentive/shared/widgets/shimmer_placeholders.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class MemberListLoading extends StatelessWidget {
  const MemberListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.tertiaryFixed,
              highlightColor: Theme.of(context).colorScheme.tertiaryFixedDim,
              child: const BannerPlaceholder(
                height: 56,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: mediumPadding),
          ],
        );
      },
    );
  }
}
