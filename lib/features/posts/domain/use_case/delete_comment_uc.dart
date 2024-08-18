import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class DeleteCommentUseCase extends BaseUseCase<String, String> {
  final PostsBaseRepository postsBaseRepository;

  DeleteCommentUseCase({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call(String id) async {
    final result = await postsBaseRepository.deleteComment(id: id);
    return result;
  }
}
