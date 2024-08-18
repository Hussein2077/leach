import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/create_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/delete_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/edit_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_posts_uc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_state.dart';

class PostsBloc extends Bloc<PostsEventBase, PostState> {
  final GetPostsUseCase getPostsUseCase;
  final DeletePostUseCase deletePostUseCase;
  final EditePostUc editePostUc;
  final CreatePostUseCase createPostUseCase;

  PostsBloc({required this.getPostsUseCase, required this.deletePostUseCase, required this.editePostUc, required this.createPostUseCase}) : super(PostInitialState()) {

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

    on<DeletePostEvent>((event, emit) async {
      emit(DeletePostsLoadingState());
      final result = await deletePostUseCase.call(event.id);
      result.fold(
              (l) => emit(DeletePostsSuccessState(message: l)),
              (r) => emit(DeletePostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<EditePostEvent>((event, emit) async {
      emit(EditePostsLoadingState());
      final result = await editePostUc.call(id: event.id, postData: event.data);
      result.fold(
              (l) => emit(EditePostsSuccessState(message: l)),
              (r) => emit(EditePostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<CreatePostEvent>((event, emit) async {
      emit(CreatePostsLoadingState());
      final result = await createPostUseCase.call(event.data);
      result.fold(
              (l) => emit(CreatePostsSuccessState(message: l)),
              (r) => emit(CreatePostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
