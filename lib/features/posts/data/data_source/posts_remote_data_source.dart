import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class PostsBaseRemotelyDataSource {
  Future<PostsModel> getPosts({required String page});
  Future<String> likePost({required String id});
  Future<String> unLikePost({required String id});
  Future<String> addComment({required String id, required String comment});
  Future<String> deletePost({required String id});
  Future<String> deleteComment({required String id});
  Future<String> editePost({var postData, required String id});
  Future<String> createPost({var postData});

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
      return data["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: 'likePost');
    }
  }

  @override
  Future<String> unLikePost({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.unLikePost(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"] ?? "success";
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
      return data["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'addComment');
    }
  }

  @override
  Future<String> deletePost({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.deletePost(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> responseData = response.data;
      return responseData["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'deletePost');
    }
  }

  @override
  Future<String> deleteComment({required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().delete(
        ConstantApi.deleteComment(id),
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> responseData = response.data;
      return responseData["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'deleteComment');
    }
  }

  @override
  Future<String> editePost({var postData, required String id}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.editePost(id),
        data: postData,
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'editePost');
    }
  }

  @override
  Future<String> createPost({var postData}) async {
    Map<String, String> headers = await DioHelper().header();

    try {
      final response = await Dio().post(
        ConstantApi.createPost,
        data: postData,
        options: Options(
          headers: headers,
        ),
      );

      Map<String, dynamic> data = response.data;
      return data["message"] ?? "success";
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: 'createPost');
    }
  }

}