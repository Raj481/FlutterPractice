import 'package:equatable/equatable.dart';
import 'package:flutter_practice/LoginBlocSample/authenticate/authentication_repository.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}