import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/utils/enums.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/data/models/breeding_model.dart';
import 'package:leach/features/home/data/models/how_toModel.dart';
import 'package:leach/features/home/data/models/search_user_model.dart';
import 'package:leach/features/home/data/models/vendor.dart';
import 'package:leach/features/home/domain/use_case/how_to_uc.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';

abstract class HomeBaseRepository {
  Future<Either<BreedingModel, Failure>> getBreeding({required String type, required String page});
  Future<Either<List<Vendor>, Failure>> getVendors ( TypeOfVendor type);
  Future<Either<List<HowToModel>, Failure>> getHowTo ( GetHowToParameter type);
  Future<Either<void, Failure>> requestBooking  (  RequestBookingParam requestBooking );

  Future<Either<SearchUserResponse, Failure>> getSearchUser({required String page, required String search});

}