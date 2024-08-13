import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/get_my_data_uc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_event.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_state.dart';

class GetMyDataBloc extends Bloc<GetMyDataEventBase, GetMyDataState> {
  final GetMyDataUseCase getMyDataUseCase;

  GetMyDataBloc({required this.getMyDataUseCase}) : super(MyDataInitialState()) {

    on<GetMyDataEvent>((event, emit) async {
      emit(GetMyDataLoadingState());
      final result = await getMyDataUseCase.call(const NoParameter());
      result.fold(
              (l) => emit(GetMyDataSuccessState(userModel: l)),
              (r) => emit(GetMyDataErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
