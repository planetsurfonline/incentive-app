import 'package:flutter/material.dart';
import 'package:psm_incentive/utils/constants.dart';

class SheetBar extends StatelessWidget {
  const SheetBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
