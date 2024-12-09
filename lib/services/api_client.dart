import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:psm_incentive/utils/env.dart';
import 'package:psm_incentive/services/token_interceptor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    log('ApiClient => ${Supabase.instance.client.auth.currentSession?.accessToken}');
    dio = Dio(
      BaseOptions(
        baseUrl: AppEnv.apiBaseUrl,
        headers: {
          'Authorization':
              'Bearer ${Supabase.instance.client.auth.currentSession?.accessToken}',
          'Accept': ContentType.json,
        },
      ),
    );
    dio.interceptors.add(
      TokenInterceptor(dio),
    );
  }
}
