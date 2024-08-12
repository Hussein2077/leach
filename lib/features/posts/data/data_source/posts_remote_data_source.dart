import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class PostsBaseRemotelyDataSource {
  Future<PostsModel> getPosts({required String page});
  Future<String> likePost({required String id});
  Future<String> unLikePost({required String id});
  Future<String> addComment({required String id, required String comment});

}

class PostsRemotelyDateSource extends PostsBaseRemotelyDataSource {

  @override
  Future<PostsModel> getPosts({required String page}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().get(
        ConstantApi.getPosts(page),
        options: Options(
          headers: headers,
        ),
      );

      return PostsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'getPosts');
    }
  }

  @override
  Future<String> likePost({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.likePost(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'likePost');
    }
  }

  @override
  Future<String> unLikePost({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.unLikePost(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'unLikePost');
    }
  }

  @override
  Future<String> addComment({required String id, required String comment}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.addComments(id),
        data: {
          "comment": comment,
        },
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"];
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'addComment');
    }
  }

}