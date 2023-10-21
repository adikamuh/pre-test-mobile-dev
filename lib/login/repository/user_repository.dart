import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/shared/dio_client.dart';

class UserReposiry {
  static Future<(User user, String token)> login(
      String username, String password) async {
    try {
      final response = await DioClient.instance.post(
        "/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      return (User.fromJson(response.data), response.data["token"] as String);
    } catch (e) {
      throw Exception(e);
    }
  }
}
