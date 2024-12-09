import 'package:psm_incentive/features/authentication/data/data.dart';

class AuthenticationRepository {
  final AuthenticationProvider _provider = AuthenticationProvider();

  Future<String> getUserData() async {
    try {
      final _ = await _provider.getUserData();

      return '';
    } catch (e) {
      rethrow;
    }
  }
}
