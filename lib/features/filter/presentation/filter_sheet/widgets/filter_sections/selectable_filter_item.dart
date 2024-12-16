import 'package:flutter/material.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class SelectableFilterItem extends StatelessWidget {
  const SelectableFilterItem({
    super.key,
    required this.item,
    required this.onSelected,
    required this.isSelected,
  });

  final Filter item;
  final Function() onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: mediumSmallPadding,
          vertical: smallPadding,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.customColor?.borderColor
              : context.colorScheme.primaryContainer,
          border: Border.all(
            color: !isSelected
                ? context.customColor!.borderColor!
                : context.customColor!.invertedProgressColor!,
          ),
          borderRadius: BorderRadius.circular(smallRadius),
        ),
        child: Text(item.label),
      ),
    );
  }
}
