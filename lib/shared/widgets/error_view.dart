import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/utils/constants.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
    this.icon,
    this.actionTitle,
  });

  final Widget? icon;
  final String title;
  final String? subtitle;
  final Function()? action;
  final String? actionTitle;

  @override
  Widget build(BuildContext context) {
    if (action != null) {
      assert(actionTitle != null);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 32,
          child: icon ?? const Icon(Icons.close_rounded, size: 32),
        ),
        const SizedBox(height: padding),
        Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        if (action != null)
          Padding(
            padding: const EdgeInsets.all(mediumSmallPadding),
            child: ElevatedButton(
              onPressed: action,
              child: Text(
                actionTitle!,
              ),
            ),
          )
      ],
    );
  }
}
