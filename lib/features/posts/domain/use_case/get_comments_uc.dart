import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/data/models/comments_model.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class GetCommentsUseCase extends BaseUseCase<CommentsModel, String> {
  final PostsBaseRepository postsBaseRepository;

  GetCommentsUseCase({required this.postsBaseRepository});

  @override
  Future<Either<CommentsModel, Failure>> call(String parameter) async {
    final result = await postsBaseRepository.getComments(id: parameter);
    return result;
  }
}
