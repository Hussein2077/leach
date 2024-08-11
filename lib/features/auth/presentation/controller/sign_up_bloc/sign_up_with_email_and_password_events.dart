import 'package:equatable/equatable.dart';

abstract class BaseSignUpWithEmailAndPasswordEvent extends Equatable {
  const BaseSignUpWithEmailAndPasswordEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordEvent
    extends BaseSignUpWithEmailAndPasswordEvent {
  final String userName;
  final String email;
  final String phone;
  final String password;
  final String country;
  final String city;
  final String name;

  const SignUpWithEmailAndPasswordEvent({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
    required this.country,
    required this.city,
    required this.name,

  }) ;


}
