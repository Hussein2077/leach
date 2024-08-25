import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/auth/domain/use_case/change_password.dart';
import 'package:leach/features/auth/domain/use_case/send_code.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:leach/features/auth/domain/use_case/verify_code.dart';
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_events.dart';
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_states.dart';

class ChangePasswordFlowBloc
    extends Bloc<BaseChangePasswordEvent, ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;
  VerifyCodeUseCase verifyCodeUseCase;
  SendCodeUseCase sendCodeUseCase;

  ChangePasswordFlowBloc(
      {required this.changePasswordUseCase,
      required this.sendCodeUseCase,
      required this.verifyCodeUseCase})
      : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) async {
      emit(const ChangePasswordLoadingState());
      final result = await changePasswordUseCase.call(SignUpModel(
          password: event.password, oldPassword: event.oldPassword));
      result.fold(
          (l) => emit(
              const ChangePasswordSuccessState(successMessage: 'Password Changed')),
          (r) => emit(ChangePasswordErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<SendCodeEvent>((event, emit) async {
      emit(const SendCodeLoadingState());
      final result = await sendCodeUseCase
          .call(SignUpModel(phone: event.phoneOrEmail, area: ''));
      result.fold(
          (l) => emit(SendCodeSuccessMessageState(successMessage: l)),
          (r) => emit(SendCodeErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<VerifyCodeEvent>((event, emit) async {
      emit(const VerifyCodeLoadingState());
      final result = await verifyCodeUseCase.call(SignUpModel(
        phone: event.email,
      ));
      result.fold(
          (l) =>
              emit(VerifyCodeSuccessMessageState(successMessage: l['message'])),
          (r) => emit(VerifyCodeErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
