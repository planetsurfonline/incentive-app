import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injector/injector.dart';
import 'package:psm_incentive/services/api_client.dart';

class AuthenticationProvider {
  final injector = Injector.appInstance;
  late final ApiClient apiClient;

  AuthenticationProvider() {
    apiClient = injector.get<ApiClient>();
  }

  Future<Response> getUserData() async {
    try {
      const path = "/api/v1/user";

      final result = await apiClient.dio.get(path);

      log('AuthenticationProvider getUserData => ${result.toString()}');

      return result;
    } catch (e) {
      log('AuthenticationProvider getUserData => ${e.toString()}');

      rethrow;
    }
  }
}
