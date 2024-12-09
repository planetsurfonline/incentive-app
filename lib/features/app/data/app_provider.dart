import 'dart:convert';
import 'dart:developer';

import 'package:injector/injector.dart';
import 'package:psm_incentive/services/api_client.dart';

class AppProvider {
  final injector = Injector.appInstance;
  late final ApiClient apiClient;

  AppProvider() {
    apiClient = injector.get<ApiClient>();
  }

  // TODO: Change String to Response from dio
  Future<String> getUserData() async {
    try {
      // const path = "/api/v1/user";

      // final result = await apiClient.dio.get(path);

      // log('AuthenticationProvider getUserData => ${result.toString()}');

      // Dummy user
      String result = jsonEncode({
        'uuid': 'asdasd',
        'operatorName': 'James Christian',
        'role': 'head',
      });

      return result;
    } catch (e) {
      log('AuthenticationProvider getUserData => ${e.toString()}');

      rethrow;
    }
  }
}
