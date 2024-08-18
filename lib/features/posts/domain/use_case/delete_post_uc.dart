import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class DeletePostUseCase extends BaseUseCase<String, String> {
  final PostsBaseRepository postsBaseRepository;

  DeletePostUseCase({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call(String id) async {
    final result = await postsBaseRepository.deletePost(id: id);
    return result;
  }
}
