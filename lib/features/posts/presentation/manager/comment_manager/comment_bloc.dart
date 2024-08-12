import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/add_comment_uc.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_event.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_state.dart';

class CommentBloc extends Bloc<CommentEventBase, CommentState> {
  final AddCommentUseCase addCommentUseCase;
  CommentBloc(
      {required this.addCommentUseCase})
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

  }
}
