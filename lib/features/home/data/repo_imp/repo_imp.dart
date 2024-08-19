import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class HomeRepositoryImp extends HomeBaseRepository {
  final HomeBaseRemotelyDataSource homeBaseRemotelyDataSource;

  HomeRepositoryImp({required this.homeBaseRemotelyDataSource});

  @override
  Future<Either<BreedingModel, Failure>> getBreeding({required String type, required String page}) async {
    try {
      final result = await homeBaseRemotelyDataSource.getBreeding(type: type, page: page);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

}