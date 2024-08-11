import 'package:dio/dio.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/constant_api.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';

abstract class PostsBaseRemotelyDataSource {
  Future<PostsModel> getPosts({required String page});

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

}