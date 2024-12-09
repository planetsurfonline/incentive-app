import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';
import 'package:psm_incentive/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:psm_incentive/features/authentication/presentation/login/widgets/widgets.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final GlobalKey<FormState> formKey = GlobalKey();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const LoginBackground(),
            Positioned(
              right: padding,
              top: padding,
              child: Row(
                children: [
                  const Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
                  ),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.isLightMode,
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(AppToggleThemeMode());
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.light_mode_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(largeMediumPadding),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(largeRadius),
                      topRight: Radius.circular(largeRadius),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.strings.appName,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: padding),
                        const LoginEmailInput(),
                        const SizedBox(height: mediumSmallPadding),
                        const LoginPasswordInput(),
                        const SizedBox(height: padding),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state.status == Status.error) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: padding),
                                child: Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        LoginSubmitButton(formKey: formKey)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
