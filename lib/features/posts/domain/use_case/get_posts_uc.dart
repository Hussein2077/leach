import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class GetPostsUseCase extends BaseUseCase<PostsModel, String> {
  final PostsBaseRepository postsBaseRepository;

  GetPostsUseCase({required this.postsBaseRepository});

  @override
  Future<Either<PostsModel, Failure>> call(String parameter) async {
    final result = await postsBaseRepository.getPosts(page: parameter);
    return result;
  }
}
