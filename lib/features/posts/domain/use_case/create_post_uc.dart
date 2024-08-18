import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class CreatePostUseCase extends BaseUseCase<String, dynamic> {
  final PostsBaseRepository postsBaseRepository;

  CreatePostUseCase({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call(var parameter) async {
    final result = await postsBaseRepository.createPost(postData: parameter);
    return result;
  }
}
