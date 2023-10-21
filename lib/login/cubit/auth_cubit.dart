import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pre_test_mobile_dev/login/service/user_service.dart';
import 'package:pre_test_mobile_dev/shared/ui/helper/shared_preferences_helper.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedOut extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void init() async {
    final token = await SharedPreferencesHelper.getToken();
    if (token != null && token.isNotEmpty) {
      emit(LoggedIn());
    } else {
      emit(LoggedOut());
    }
  }

  void login(String username, String password) async {
    emit(AuthLoading());
    try {
      await UserService.login(username, password);
      emit(LoggedIn());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void logout() async {
    emit(AuthLoading());
    await UserService.logout();
    emit(LoggedOut());
  }
}
