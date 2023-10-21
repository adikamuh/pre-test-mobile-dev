import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/shared/ui/helper/shared_preferences_helper.dart';

class ProfileService {
  static Future<User> getProfile() async {
    try {
      final user = await SharedPreferencesHelper.getUser();

      if (user == null) {
        throw Exception("User not found");
      } else {
        return user;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
