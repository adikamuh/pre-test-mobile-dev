import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/profile/service/profile_service.dart';
import 'package:pre_test_mobile_dev/shared/model/base_state.dart';

class ProfileCubit extends Cubit<BaseState<User>> {
  ProfileCubit() : super(BaseState.inital());

  void init() async {
    emit(const Loading());
    try {
      final user = await ProfileService.getProfile();
      emit(Success(data: user));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
