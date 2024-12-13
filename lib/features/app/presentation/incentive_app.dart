import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:psm_incentive/features/app/data/app_repository.dart';
import 'package:psm_incentive/features/app/presentation/app_loading.dart';
import 'package:psm_incentive/features/app/presentation/bloc/app_bloc.dart';
import 'package:psm_incentive/features/app/presentation/theme_bloc/theme_bloc.dart';
import 'package:psm_incentive/features/authentication/authentication.dart';
import 'package:psm_incentive/features/pages/home_page/home_page.dart';
import 'package:psm_incentive/features/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IncentiveApp extends StatelessWidget {
  const IncentiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(
            supabaseClient: Supabase.instance.client,
            repository: AppRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()
            ..add(ThemeGetMode())
            ..add(AppGetInitialLocale())
            ..add(SettingGetNominalVisibility()),
        ),
      ],
      child: const IncentiveAppView(),
    );
  }
}

class IncentiveAppView extends StatefulWidget {
  const IncentiveAppView({super.key});

  @override
  State<IncentiveAppView> createState() => _IncentiveAppViewState();
}

class _IncentiveAppViewState extends State<IncentiveAppView> {
  StreamSubscription<AuthState>? _authSubscription;

  SupabaseClient supabase = Supabase.instance.client;

  void handleOAuthListener() {
    _authSubscription =
        supabase.auth.onAuthStateChange.listen((AuthState data) {
      context.read<AppBloc>().add(CheckUserSession());
    });
  }

  @override
  void initState() {
    handleOAuthListener();

    super.initState();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Planet Surf Incentive',
          theme: buildTheme(),
          darkTheme: buildDarkTheme(),
          themeMode: state.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // localeListResolutionCallback: (locales, supportedLocales) {
          //   return const Locale('id', 'ID');
          // },
          locale: state.locale,
          home: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.status == AppAuthStatus.initial) {
                return const AppLoading();
              }

              if (state.status == AppAuthStatus.unauthenticated) {
                return const LoginPage();
              }

              return const HomePage();
            },
          ),
        );
      },
    );
  }
}
