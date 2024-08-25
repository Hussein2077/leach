import 'package:equatable/equatable.dart';
import 'package:leach/features/auth/data/models/auth_with_apple_model.dart';
import 'package:leach/features/auth/data/models/auth_with_google_model.dart';

abstract class SignInWithPlatformState extends Equatable {
  const SignInWithPlatformState();

  @override
  List<Object> get props => [];
}

class SignInWithPlatformInitial extends SignInWithPlatformState {}

class SiginWithPlatFormLoadingState extends SignInWithPlatformState {
  const SiginWithPlatFormLoadingState();
}

class SiginWithGoogleErrorMessageState extends SignInWithPlatformState {
  final String errorMessage;

  const SiginWithGoogleErrorMessageState({required this.errorMessage});
}

class SiginWithGoogleSuccesMessageState extends SignInWithPlatformState {
  final AuthWithGoogleModel userData;

  const SiginWithGoogleSuccesMessageState({required this.userData});
}

class SiginWithAppleSuccesMessageState extends SignInWithPlatformState {
  final String succesMessage;
  final AuthWithAppleModel userModel;
  const SiginWithAppleSuccesMessageState(
      {required this.userModel, required this.succesMessage});
}

class SiginWithAppleErrorMessageState extends SignInWithPlatformState {
  final String errorMessage;

  const SiginWithAppleErrorMessageState({required this.errorMessage});
}
