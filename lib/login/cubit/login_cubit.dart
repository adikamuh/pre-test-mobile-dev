import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/login/service/user_service.dart';
import 'package:pre_test_mobile_dev/shared/model/base_state.dart';

class LoginCubit extends Cubit<BaseState<User>> {
  LoginCubit() : super(BaseState.inital());

  Future<void> login(String username, String password) async {
    emit(const Loading());
    try {
      final user = await UserService.login(username, password);
      emit(Success(data: user));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
