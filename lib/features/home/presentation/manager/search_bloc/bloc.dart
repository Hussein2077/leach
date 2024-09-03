import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/home/domain/use_case/get_search_user_uc.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/event.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/state.dart';
class GetSearchUserBloc extends Bloc<GetSearchUserEventBase,  GetSearchState > {
  final GetSearchUserUseCase getSearchUserUseCase;
  GetSearchUserBloc({required this.getSearchUserUseCase}) : super(SearchUserInitialState()) {

    on<GetSearchUserEvent>((event, emit) async {
      emit(GetSearchUserLoadingState());
      final result = await getSearchUserUseCase.call(SearchParam(page: event.page, search: event.query) );
      result.fold(
              (l) => emit(GetSearchUserSuccessState(searchUserResponse: l)),
              (r) => emit(GetSearchUserErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetMoreSearchUserEvent>((event, emit) async {
      emit(GetMoreSearchUserLoadingState());
      final result = await getSearchUserUseCase.call(SearchParam(page: event.page, search: event.query));
      result.fold(
              (l) => emit(GetMoreSearchUserSuccessState(searchUserResponse: l)),
              (r) => emit(GetMoreSearchUserErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
