import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(appLocalizations.passwordLabel),
        const SizedBox(height: mediumSmallPadding),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                hintText: appLocalizations.inputPasswordHint,
                suffixIcon: IconButton(
                  icon: Icon(state.isPasswordHidden
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .add(LoginTogglePasswordVisibility());
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return appLocalizations.passwordCannotBeEmptyError;
                }
                if (value.length < 5) {
                  return appLocalizations.minimumPasswordLengthNotAchieved;
                }

                return null;
              },
              keyboardType: state.isPasswordHidden
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
              textCapitalization: TextCapitalization.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              obscureText: state.isPasswordHidden,
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password: value));
              },
            );
          },
        ),
      ],
    );
  }
}
