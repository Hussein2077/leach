import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/like_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/un_like_post_uc.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_event.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_state.dart';

class LikePostsBloc extends Bloc<LikePostsEventBase, LikePostState> {
  final LikePostUc likePostUc;
  final UnLikePostUc unLikePostUc;
  LikePostsBloc({required this.likePostUc, required this.unLikePostUc}) : super(LikePostInitialState()) {

    on<LikeEvent>((event, emit) async {
      emit(LikePostsLoadingState());
      final result = await likePostUc.call(id: event.id);
      result.fold(
          (l) => emit(LikePostsSuccessState(message: l)),
          (r) => emit(LikePostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<UnLikeEvent>((event, emit) async {
      emit(UnLikePostsLoadingState());
      final result = await unLikePostUc.call(id: event.id);
      result.fold(
              (l) => emit(UnLikePostsSuccessState(message: l)),
              (r) => emit(UnLikePostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
