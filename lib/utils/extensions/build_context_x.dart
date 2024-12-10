import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:psm_incentive/features/theme/custom_colors.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;

  CustomColors? get customColor => Theme.of(this).extension<CustomColors>();
}
