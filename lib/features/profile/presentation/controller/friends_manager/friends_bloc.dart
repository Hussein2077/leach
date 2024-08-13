import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/get_friends_uc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_event.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_state.dart';

class GetFriendsBloc extends Bloc<GetFriendsEventBase, GetFriendState> {
  final GetFriendsUseCase getFriendsUseCase;
  GetFriendsBloc({required this.getFriendsUseCase}) : super(FriendInitialState()) {

    on<GetFriendsEvent>((event, emit) async {
      emit(GetFriendsLoadingState());
      final result = await getFriendsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetFriendsSuccessState(friendsModel: l)),
              (r) => emit(GetFriendsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetMoreFriendsEvent>((event, emit) async {
      emit(GetMoreFriendsLoadingState());
      final result = await getFriendsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetMoreFriendsSuccessState(friendsModel: l)),
              (r) => emit(GetMoreFriendsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
