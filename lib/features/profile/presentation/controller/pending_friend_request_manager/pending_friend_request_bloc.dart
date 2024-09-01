import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/domain/use_case/accept_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/block_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_pending_friend_requests_uc.dart';
import 'package:leach/features/profile/domain/use_case/reject_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/remove_friend_uc.dart';
import 'package:leach/features/profile/domain/use_case/sned_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/un_block_user_uc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_event.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_state.dart';

class GetFriendRequestBloc extends Bloc<GetFriendRequestEventBase, GetFriendRequestState> {
  final GetPendingFriendRequestsUseCase getFriendRequestUseCase;
  final AcceptFriendRequestsUseCase acceptFriendRequestsUseCase;
  final RejectFriendRequestsUseCase rejectFriendRequestsUseCase;
  final SendFriendRequestsUseCase sendFriendRequestsUseCase;
  final RemoveFriendUseCase removeFriendUseCase;
  final BlockUserUseCase blockUserUseCase;
  final UnBlockUserUseCase unBlockUserUseCase;

  GetFriendRequestBloc({required this.getFriendRequestUseCase, required this.acceptFriendRequestsUseCase, required this.rejectFriendRequestsUseCase, required this.removeFriendUseCase, required this.sendFriendRequestsUseCase, required this.blockUserUseCase, required this.unBlockUserUseCase}) : super(FriendRequestInitialState()) {

    on<GetFriendRequestEvent>((event, emit) async {
      emit(GetFriendRequestsLoadingState());
      final result = await getFriendRequestUseCase.call(event.page);
      result.fold(
              (l) => emit(GetFriendRequestsSuccessState(pendingFriendRequestsModel: l)),
              (r) => emit(GetFriendRequestsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetMoreFriendRequestEvent>((event, emit) async {
      emit(GetMoreFriendRequestsLoadingState());
      final result = await getFriendRequestUseCase.call(event.page);
      result.fold(
              (l) => emit(GetMoreFriendRequestsSuccessState(pendingFriendRequestsModel: l)),
              (r) => emit(GetMoreFriendRequestsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<AcceptFriendRequestEvent>((event, emit) async {
      emit(AcceptFriendRequestsLoadingState());
      final result = await acceptFriendRequestsUseCase.call(event.id);
      result.fold(
              (l) => emit(AcceptFriendRequestsSuccessState(message: l)),
              (r) => emit(AcceptFriendRequestsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<RejectFriendRequestEvent>((event, emit) async {
      emit(RejectFriendRequestsLoadingState());
      final result = await rejectFriendRequestsUseCase.call(event.id);
      result.fold(
              (l) => emit(RejectFriendRequestsSuccessState(message: l)),
              (r) => emit(RejectFriendRequestsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<RemoveFriendEvent>((event, emit) async {
      emit(RemoveFriendLoadingState());
      final result = await removeFriendUseCase.call(event.id);
      result.fold(
              (l) => emit(RemoveFriendSuccessState(message: l)),
              (r) => emit(RemoveFriendErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<SendFriendRequestEvent>((event, emit) async {
      emit(SendFriendRequestsLoadingState());
      final result = await sendFriendRequestsUseCase.call(event.id);
      result.fold(
              (l) => emit(SendFriendRequestsSuccessState(message: l)),
              (r) => emit(SendFriendRequestsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<BlockUserEvent>((event, emit) async {
      emit(BlockUserLoadingState());
      final result = await blockUserUseCase.call(event.id);
      result.fold(
              (l) => emit(BlockUserSuccessState(message: l)),
              (r) => emit(BlockUserErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<UnBlockUserEvent>((event, emit) async {
      emit(UnBlockUserLoadingState());
      final result = await unBlockUserUseCase.call(event.id);
      result.fold(
              (l) => emit(UnBlockUserSuccessState(message: l)),
              (r) => emit(UnBlockUserErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
