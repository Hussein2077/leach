import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/auth/domain/use_case/google_sign_in_usecase.dart';
import 'package:leach/features/auth/domain/use_case/sign_with_apple_us.dart';

import 'sign_in_with_platform_event.dart';
import 'sign_in_with_platform_state.dart';

class SignInWithPlatformBloc extends Bloc<BaseSignInWithPlatformEvent, SignInWithPlatformState> {
  final SignInWithGoogleUC signInWithGoogleUC;
  final SignInWithAppleUC signInWithAppleUC;

  SignInWithPlatformBloc({
    required this.signInWithGoogleUC,
    required this.signInWithAppleUC,
  }) : super(SignInWithPlatformInitial()) {
    on<SiginGoogleEvent>((event, emit) async {
      emit(const SiginWithPlatFormLoadingState());
      final result = await signInWithGoogleUC.call(const NoParameter());
      result.fold(
          (l) => emit(SiginWithGoogleSuccesMessageState(userData: l)),
          (r) => emit(SiginWithGoogleErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<SiginAppleEvent>((event, emit) async {
      emit(const SiginWithPlatFormLoadingState());
      final signinOrFailur = await signInWithAppleUC.call(const NoParameter());
      signinOrFailur.fold(
          (l) => emit(SiginWithAppleSuccesMessageState(
              succesMessage: "Sign In Succesfully", userModel: l)),
          (r) => emit(SiginWithAppleErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
