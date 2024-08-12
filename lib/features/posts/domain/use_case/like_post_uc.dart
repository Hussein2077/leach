import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class LikePostUc {
  final PostsBaseRepository postsBaseRepository;

  LikePostUc({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call({required String id}) async {
    final result = await postsBaseRepository.likePost(id: id);
    return result;
  }
}
