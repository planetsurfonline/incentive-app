import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:psm_incentive/features/app/presentation/incentive_app.dart';
import 'package:psm_incentive/services/api_client.dart';
import 'package:psm_incentive/utils/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupSupabase();

  final injector = Injector.appInstance;

  injector.registerSingleton(() => ApiClient());

  runApp(const IncentiveApp());
}

void setupSupabase() async {
  await Supabase.initialize(url: AppEnv.baseUrl, anonKey: AppEnv.anonKey);

  // ApiClient();
}
