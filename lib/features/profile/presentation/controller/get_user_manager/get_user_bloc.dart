import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/get_user_uc.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_event.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEventBase, GetUserState> {
  final GetUserUseCase getUserUseCase;
  GetUserBloc({required this.getUserUseCase}) : super(UserInitialState()) {

    on<GetUserEvent>((event, emit) async {
      emit(GetUserLoadingState());
      final result = await getUserUseCase.call(event.id);
      result.fold(
              (l) => emit(GetUserSuccessState(userDataModel: l)),
              (r) => emit(GetUserErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
