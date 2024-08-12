import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class PostsBaseRepository {
  Future<Either<PostsModel, Failure>> getPosts({required String page});
  Future<Either<String, Failure>> likePost({required String id});
  Future<Either<String, Failure>> unLikePost({required String id});
  Future<Either<String, Failure>> addComment({required String id, required String comment});
}
