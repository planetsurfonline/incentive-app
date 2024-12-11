import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:psm_incentive/utils/env.dart';
import 'package:psm_incentive/services/token_interceptor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    final accessToken =
        Supabase.instance.client.auth.currentSession?.accessToken;

    log('ApiClient => $accessToken');

    dio = Dio(
      BaseOptions(
        baseUrl: AppEnv.apiBaseUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': ContentType.json,
        },
      ),
    );
    dio.interceptors.add(
      TokenInterceptor(dio),
    );
  }
}
