import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';

class RequestBookingUseCase extends BaseUseCase<void, RequestBookingParam> {
  final HomeBaseRepository homeBaseRepository;

  RequestBookingUseCase({required this.homeBaseRepository});

  @override
  Future<Either<void, Failure>> call(RequestBookingParam parameter) async {
    final result = await homeBaseRepository.requestBooking(parameter);
    return result;
  }
}

class CancelBookingUseCase extends BaseUseCase<void, int> {
  final HomeBaseRepository homeBaseRepository;

  CancelBookingUseCase({required this.homeBaseRepository});

  @override
  Future<Either<void, Failure>> call(int parameter) async {
    final result = await homeBaseRepository.cancelBooking(parameter);
    return result;
  }
}

class RequestBookingParam {
  final int vendorId;
  final String date;
  final String time;

  RequestBookingParam(
      {required this.vendorId, required this.date, required this.time});
}
