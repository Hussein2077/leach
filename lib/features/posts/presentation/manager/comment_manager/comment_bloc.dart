import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/add_comment_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_comments_uc.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_event.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_state.dart';

class CommentBloc extends Bloc<CommentEventBase, CommentState> {
  final AddCommentUseCase addCommentUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  CommentBloc(
      {required this.addCommentUseCase, required this.getCommentsUseCase})
      : super(CommentInitialState()) {

    on<AddCommentEvent>((event, emit) async {
      emit(AddCommentLoadingState());
      final result =
          await addCommentUseCase.call(id: event.id, comment: event.comment);
      result.fold(
          (l) => emit(AddCommentSuccessState(message: l)),
          (r) => emit(AddCommentErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<GetCommentsEvent>((event, emit) async {
      emit(GetCommentLoadingState());
      final result = await getCommentsUseCase.call(event.id);
      result.fold(
              (l) => emit(GetCommentSuccessState(commentsModel: l)),
              (r) => emit(GetCommentErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });

  }
}
