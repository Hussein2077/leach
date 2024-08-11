import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';

class SignUpWithEmailAndPasswordBloc extends Bloc<
    BaseSignUpWithEmailAndPasswordEvent, SignUpWithEmailAndPasswordState> {
  SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;

  SignUpWithEmailAndPasswordBloc(
      {required this.signUpWithEmailAndPasswordUseCase})
      : super(SignUpWithEmailAndPasswordInitial()) {
    on<SignUpWithEmailAndPasswordEvent>((event, emit) async {
      emit(const SignUpWithEmailAndPasswordLoadingState());
      final result = await signUpWithEmailAndPasswordUseCase.call(SignUpModel(
        password: event.password,
        phone: event.phone,
        area: event.country,
        city: event.city,
        name: event.name,
        userName: event.userName,
        email: event.email

      ));
      result.fold(
          (l) => emit(const SignUpWithEmailAndPasswordSuccessMessageState(
              successMessage: 'success')),
          (r) => emit(SignUpWithEmailAndPasswordErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
