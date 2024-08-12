import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/get_posts_uc.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEventBase, GetPostState> {
  final GetPostsUseCase getPostsUseCase;

  GetPostsBloc({required this.getPostsUseCase}) : super(PostInitialState()) {

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
