import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class UnLikePostUc {
  final PostsBaseRepository postsBaseRepository;

  UnLikePostUc({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call({required String id}) async {
    final result = await postsBaseRepository.unLikePost(id: id);
    return result;
  }
}
