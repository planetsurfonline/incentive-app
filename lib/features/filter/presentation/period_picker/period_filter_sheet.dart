import 'package:flutter/material.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/picker/pickers.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class PeriodFilterSheet extends StatefulWidget {
  const PeriodFilterSheet({
    super.key,
  });

  @override
  State<PeriodFilterSheet> createState() => _PeriodFilterSheetState();
}

class _PeriodFilterSheetState extends State<PeriodFilterSheet>
    with TickerProviderStateMixin {
  late List<Tab> _tabs;

  @override
  Widget build(BuildContext context) {
    _tabs = [
      Tab(text: context.strings.periodLabel),
      Tab(text: context.strings.monthLabel),
      Tab(text: context.strings.customLabel),
    ];

    final TabController controller =
        TabController(length: _tabs.length, vsync: this);

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.54,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(largeRadius),
          topRight: Radius.circular(largeRadius),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: padding),
      child: Column(
        children: [
          Container(
            height: 44,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.customColor!.borderColor!,
                ),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: padding),
            padding: const EdgeInsets.only(bottom: mediumSmallPadding),
            child: TabBar(
              controller: controller,
              tabs: _tabs,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                border: Border.all(color: context.customColor!.borderColor!),
                borderRadius: BorderRadius.circular(mediumRadius),
              ),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                PeriodPickerFilter(),
                CustomMonthPickerFilter(),
                CustomDatePickerFilter(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    fixedSize: const WidgetStatePropertyAll(
                      Size.fromHeight(44),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(mediumRadius),
                      ),
                    ),
                  ),
              child: Text(context.strings.applyLabel),
            ),
          )
        ],
      ),
    );
  }
}
