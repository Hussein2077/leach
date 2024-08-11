import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/posts/data/data_source/posts_remote_data_source.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';

class PostsRepositoryImp extends PostsBaseRepository {
  final PostsBaseRemotelyDataSource postsBaseRemotelyDataSource;

  PostsRepositoryImp({required this.postsBaseRemotelyDataSource});

  @override
  Future<Either<PostsModel, Failure>> getPosts({required String page}) async {
    try {
      final result = await postsBaseRemotelyDataSource.getPosts(page: page);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}