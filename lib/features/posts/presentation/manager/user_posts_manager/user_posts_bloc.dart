import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/create_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/delete_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/edit_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_user_posts_uc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEventBase, UserPostState> {
  final GetUserPostsUseCase getUserPostsUseCase;
  final DeletePostUseCase deleteUserPostUseCase;
  final EditePostUc editeUserPostUc;
  final CreatePostUseCase createUserPostUseCase;

  UserPostsBloc({required this.getUserPostsUseCase, required this.deleteUserPostUseCase, required this.editeUserPostUc, required this.createUserPostUseCase}) : super(UserPostInitialState()) {

    on<GetUserPostsEvent>((event, emit) async {
      emit(GetUserPostsLoadingState());
      final result = await getUserPostsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetUserPostsSuccessState(postsModel: l)),
              (r) => emit(GetUserPostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetUserMorePostsEvent>((event, emit) async {
      emit(GetUserMorePostsLoadingState());
      final result = await getUserPostsUseCase.call(event.page);
      result.fold(
              (l) => emit(GetUserMorePostsSuccessState(postsModel: l)),
              (r) => emit(GetUserMorePostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<DeleteUserPostEvent>((event, emit) async {
      emit(DeleteUserPostsLoadingState());
      final result = await deleteUserPostUseCase.call(event.id);
      result.fold(
              (l) => emit(DeleteUserPostsSuccessState(message: l)),
              (r) => emit(DeleteUserPostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<EditeUserPostEvent>((event, emit) async {
      emit(EditeUserPostsLoadingState());
      final result = await editeUserPostUc.call(id: event.id, postData: event.data);
      result.fold(
              (l) => emit(EditeUserPostsSuccessState(message: l)),
              (r) => emit(EditeUserPostsErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<CreatePostEvent>((event, emit) async {
      emit(CreatePostsLoadingState());
      final result = await createUserPostUseCase.call(event.data);
      result.fold(
              (l) => emit(CreatePostsSuccessState(message: l)),
              (r) => emit(CreatePostsErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
