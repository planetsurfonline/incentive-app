import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                fixedSize: const WidgetStatePropertyAll(
                  Size.fromHeight(54),
                ),
              ),
          onPressed: state.status == Status.loading
              ? () {}
              : () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
          child: state.status == Status.loading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                )
              : Text(context.strings.loginLabel),
        );
      },
    );
  }
}
