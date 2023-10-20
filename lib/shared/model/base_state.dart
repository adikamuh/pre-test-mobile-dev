import 'package:equatable/equatable.dart';

abstract class BaseState<T> extends Equatable {
  const BaseState();

  factory BaseState.inital() => Initial();
}

class Initial<T> extends BaseState<T> {
  @override
  List<Object?> get props => [];
}

class Loading<T> extends BaseState<T> {
  final T? data;
  const Loading({this.data});

  @override
  List<Object?> get props => [data];
}

class Success<T> extends BaseState<T> {
  final T data;
  const Success({required this.data});

  @override
  List<Object?> get props => [data];
}

class Error<T> extends BaseState<T> {
  final T? data;
  final String message;
  const Error({this.data, required this.message});

  @override
  List<Object?> get props => [data, message];
}
