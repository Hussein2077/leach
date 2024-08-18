import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/domain/use_case/delete_comment_uc.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_event.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_state.dart';

class DeleteCommentBloc extends Bloc<DeleteCommentEventBase, DeleteCommentState> {
  final DeleteCommentUseCase deleteCommentUseCase;
  DeleteCommentBloc({required this.deleteCommentUseCase}) : super(DeleteCommentInitialState()) {
    on<DeleteCommentEvent>((event, emit) async {
      emit(DeleteCommentLoadingState());
      final result = await deleteCommentUseCase.call(event.id);
      result.fold(
              (l) => emit(DeleteCommentSuccessState(message: l)),
              (r) => emit(DeleteCommentErrorState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
