import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: padding),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
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
    );
  }
}
