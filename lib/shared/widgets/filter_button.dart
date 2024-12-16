import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.filter_list_outlined),
          Text(context.strings.filterLabel)
        ],
      ),
    );
  }
}
