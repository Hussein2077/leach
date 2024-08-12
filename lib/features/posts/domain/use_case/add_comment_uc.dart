import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class AddCommentUseCase {
  final PostsBaseRepository postsBaseRepository;

  AddCommentUseCase({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call({required String id, required String comment}) async {
    final result = await postsBaseRepository.addComment(id: id, comment: comment);
    return result;
  }
}
