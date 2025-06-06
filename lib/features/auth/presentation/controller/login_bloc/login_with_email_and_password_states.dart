
import 'package:equatable/equatable.dart';

abstract class LoginWithEmailAndPasswordState extends Equatable {
  const LoginWithEmailAndPasswordState();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPasswordInitial extends LoginWithEmailAndPasswordState {}
class LoginWithEmailAndPasswordLoadingState extends LoginWithEmailAndPasswordState{
  const LoginWithEmailAndPasswordLoadingState();
}
class LoginWithEmailAndPasswordErrorMessageState extends LoginWithEmailAndPasswordState{
  final String errorMessage ;

  const LoginWithEmailAndPasswordErrorMessageState({required this.errorMessage});


}

class LoginWithEmailAndPasswordSuccessMessageState extends LoginWithEmailAndPasswordState{
  final String successMessage ;


  const LoginWithEmailAndPasswordSuccessMessageState(  {required this.successMessage,});
}class DeleteAccountLoadingState extends LoginWithEmailAndPasswordState{
  const DeleteAccountLoadingState();
}
class DeleteAccountErrorMessageState extends LoginWithEmailAndPasswordState{
  final String errorMessage ;

  const DeleteAccountErrorMessageState({required this.errorMessage});


}

class DeleteAccountSuccessMessageState extends LoginWithEmailAndPasswordState{
  final String successMessage ;

  const DeleteAccountSuccessMessageState(  {required this.successMessage,});

}