import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';

class IncentiveVisibilityToggle extends StatelessWidget {
  const IncentiveVisibilityToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<ThemeBloc>().add(SettingToggleNominalVisibility());
          },
          icon: Icon(state.showNominal
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
        );
      },
    );
  }
}
