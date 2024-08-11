import 'package:equatable/equatable.dart';

abstract class BaseLoginWithEmailAndPasswordEvent extends Equatable {
  const BaseLoginWithEmailAndPasswordEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPasswordEvent
    extends BaseLoginWithEmailAndPasswordEvent {
  final String phoneOrEmail;

  final String password;

  const LoginWithEmailAndPasswordEvent(
      {required this.phoneOrEmail, required this.password});
}

class DeleteAccountEvent extends BaseLoginWithEmailAndPasswordEvent {}
