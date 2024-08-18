import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/get_posts_uc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_state.dart';

class PostsBloc extends Bloc<PostsEventBase, PostState> {
  final GetPostsUseCase getPostsUseCase;
  PostsBloc({required this.getPostsUseCase}) : super(PostInitialState()) {

    on<GetPostsEvent>((event, emit) async {
      emit(GetPostsLoadingState());
      final result = await getPostsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetPostsSuccessState(postsModel: l)),
              (r) => emit(GetPostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetMorePostsEvent>((event, emit) async {
      emit(GetMorePostsLoadingState());
      final result = await getPostsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetMorePostsSuccessState(postsModel: l)),
              (r) => emit(GetMorePostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
