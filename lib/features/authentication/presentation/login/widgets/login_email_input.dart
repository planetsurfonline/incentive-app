import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';
import 'package:psm_incentive/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final RegExp pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Email'),
        const SizedBox(height: mediumSmallPadding),
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: appLocalizations.inputEmailHint,
              ),
              validator: (value) {
                if (!pattern.hasMatch(value!)) {
                  return appLocalizations.emailIsNotValidError;
                }
                if (value.isEmpty) {
                  return appLocalizations.emailCannotBeEmptyError;
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginEmailChanged(email: value));
              },
            );
          },
        ),
      ],
    );
  }
}
