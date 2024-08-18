import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class EditePostUc {
  final PostsBaseRepository postsBaseRepository;
  EditePostUc({required this.postsBaseRepository});

  @override
  Future<Either<String, Failure>> call({var postData, required String id}) async {
    final result = await postsBaseRepository.editePost(id: id, postData: postData);
    return result;
  }
}
