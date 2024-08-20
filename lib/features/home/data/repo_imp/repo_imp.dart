import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';

class HomeRepositoryImp extends HomeBaseRepository {
  final HomeBaseRemotelyDataSource homeBaseRemotelyDataSource;

  HomeRepositoryImp({required this.homeBaseRemotelyDataSource});

  @override
  Future<Either<BreedingModel, Failure>> getBreeding(
      {required String type, required String page}) async {
    try {
      final result =
          await homeBaseRemotelyDataSource.getBreeding(type: type, page: page);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<List<Vendor>, Failure>> getVendors(TypeOfVendor type) async {
    try {
      final result = await homeBaseRemotelyDataSource.getVendors(type);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }  @override
  Future<Either< void, Failure>> requestBooking (RequestBookingParam requestBooking ) async {
    try {
      final result = await homeBaseRemotelyDataSource.requestBooking(requestBooking );
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }@override
  Future<Either< void, Failure>> cancelBooking  ( int bookingId  ) async {
    try {
      final result = await homeBaseRemotelyDataSource.cancelBooking(  bookingId  );
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
