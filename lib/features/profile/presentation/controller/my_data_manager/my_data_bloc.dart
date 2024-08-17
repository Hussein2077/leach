import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/change_privacy_use_case.dart';
import 'package:leach/features/profile/domain/use_case/get_my_data_uc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';

class GetMyDataBloc extends Bloc<GetMyDataEventBase, GetMyDataState> {
  final GetMyDataUseCase getMyDataUseCase;
  final ChangePrivacyUseCase changePrivacyUseCase;

  GetMyDataBloc({required this.getMyDataUseCase, required this.changePrivacyUseCase}) : super(MyDataInitialState()) {

    on<GetMyDataEvent>((event, emit) async {
      emit(GetMyDataLoadingState());
      final result = await getMyDataUseCase.call(const NoParameter());
      result.fold(
              (l) => emit(GetMyDataSuccessState(userModel: l)),
              (r) => emit(GetMyDataErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<ChangePrivacyEvent>((event, emit) async {
      emit(ChangePrivacyLoadingState());
      final result = await changePrivacyUseCase.call(const NoParameter());
      result.fold(
              (l) => emit(ChangePrivacySuccessState(message: l)),
              (r) => emit(ChangePrivacyErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
