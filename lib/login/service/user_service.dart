import 'package:pre_test_mobile_dev/login/repository/user_repository.dart';
import 'package:pre_test_mobile_dev/shared/ui/helper/shared_preferences_helper.dart';

class UserService {
  static Future<void> login(String username, String password) async {
    try {
      final (user, token) = await UserReposiry.login(username, password);
      await SharedPreferencesHelper.setToken(token);
      await SharedPreferencesHelper.setUser(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> logout() async {
    await SharedPreferencesHelper.clear();
  }
}
