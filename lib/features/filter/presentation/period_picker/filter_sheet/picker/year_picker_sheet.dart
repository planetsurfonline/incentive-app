import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class YearPickerSheet extends StatefulWidget {
  YearPickerSheet({
    super.key,
    required this.startYear,
    int? endYear,
    required this.initialYear,
  }) : endYear = endYear ?? DateTime.now().year;
  // initialYear = initialYear ?? endYear;

  final int startYear;
  final int endYear;
  final int? initialYear;

  @override
  State<YearPickerSheet> createState() => _YearPickerSheetState();
}

class _YearPickerSheetState extends State<YearPickerSheet> {
  late int selectedYear;

  @override
  void initState() {
    super.initState();

    selectedYear = widget.startYear;
  }

  @override
  Widget build(BuildContext context) {
    List<int> years = [];

    var currentYear = widget.startYear;
    for (int i = widget.startYear; i <= widget.endYear; i++) {
      years.add(currentYear++);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WheelChooser.integer(
            onValueChanged: (value) {
              setState(() {
                selectedYear = value;
              });
            },
            initValue: widget.initialYear,
            minValue: widget.startYear,
            step: 1,
            maxValue: widget.endYear,
            listHeight: 200,
            reverse: true,
            selectTextStyle: GoogleFonts.inter(),
            unSelectTextStyle: const TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(selectedYear);
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
      // Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: years
      //       .map((year) => GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).pop(year);
      //             },
      //             child: Container(
      //               padding: const EdgeInsets.all(padding),
      //               child: Text(year.toString()),
      //             ),
      //           ))
      //       .toList(),
      // ),
    );
  }
}
