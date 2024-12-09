import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio; // Dio instance to perform requests.

  TokenInterceptor(this._dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // If response is fine, just continue
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Detected token expiration
      try {
        String newAccessToken = await refreshAccessToken();
        // Update Dio instance with new token
        updateDioBearerToken(_dio, newAccessToken);
        // Clone the original request
        final opts = Options(
          method: err.requestOptions.method,
          headers: {
            ...err.requestOptions.headers,
            ..._dio.options.headers,
          },
        );
        // Retry the original request with the new token
        final cloneReq = await _dio.request(
          err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        // Return the new request's response
        return handler.resolve(cloneReq);
      } catch (e) {
        // Handle token refresh error (e.g., refresh token is also expired)
        return handler.next(err);
      }
    }
    // For other errors, just continue
    handler.next(err);
  }
}

// Assuming this function refreshes your token
Future<String> refreshAccessToken() async {
  // Your token refresh logic here
  log('refreshAccessToken Refreshing Token');
  await Supabase.instance.client.auth.refreshSession();

  return Supabase.instance.client.auth.currentSession!.accessToken;
}

// Function to update Dio instance with new bearer token
void updateDioBearerToken(Dio dio, String token) {
  log('updateDioBearerToken Update bearer token');

  dio.options.headers['Authorization'] = 'Bearer $token';
}
