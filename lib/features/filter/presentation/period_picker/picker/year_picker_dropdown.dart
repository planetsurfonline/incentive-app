import 'package:flutter/material.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/picker/pickers.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class YearPickerDropdown extends StatelessWidget {
  const YearPickerDropdown({
    super.key,
    required this.initialYear,
    required this.year,
    required this.onYearPicked,
  });

  final int initialYear;
  final String year;
  final Function(int) onYearPicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedYear = await showModalBottomSheet(
          context: context,
          builder: (_) {
            return YearPickerSheet(
              startYear: 2023,
              initialYear: initialYear,
            );
          },
        ) as int?;

        if (pickedYear != null) {
          if (context.mounted) {
            onYearPicked(pickedYear);
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(color: context.customColor!.borderColor!),
          borderRadius: BorderRadius.circular(mediumRadius),
        ),
        padding: const EdgeInsets.all(mediumSmallPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(year),
            const Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
      ),
    );
  }
}
