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

  @override
  Future<Either<String, Failure>> likePost({required String id}) async {
    try {
      final result = await postsBaseRemotelyDataSource.likePost(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> unLikePost({required String id}) async {
    try {
      final result = await postsBaseRemotelyDataSource.unLikePost(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> addComment({required String id, required String comment}) async {
    try {
      final result = await postsBaseRemotelyDataSource.addComment(id: id, comment: comment);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> deletePost({required String id}) async {
    try {
      final result = await postsBaseRemotelyDataSource.deletePost(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> deleteComment({required String id}) async {
    try {
      final result = await postsBaseRemotelyDataSource.deleteComment(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> editePost({var postData, required String id}) async {
    try {
      final result = await postsBaseRemotelyDataSource.editePost(postData: postData, id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> createPost({var postData}) async {
    try {
      final result = await postsBaseRemotelyDataSource.createPost(postData: postData);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}