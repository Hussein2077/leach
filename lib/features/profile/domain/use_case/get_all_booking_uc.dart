import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';

class GetAllBookingUseCase extends BaseUseCase<List<AllBookingModel>, NoParameter> {
  ProfileBaseRepository profileBaseRepository;
  GetAllBookingUseCase({required this.profileBaseRepository});

  @override
  Future<Either<List<AllBookingModel>, Failure>> call( parameter) async {
    final result = await profileBaseRepository.getAllBooking();
    return result;
  }
}
class CancelBookingUseCase extends BaseUseCase<void, int> {
  ProfileBaseRepository profileBaseRepository;

  CancelBookingUseCase({required this.profileBaseRepository});

  @override
  Future<Either<void, Failure>> call(int parameter) async {
    final result = await profileBaseRepository.cancelBooking(parameter);
    return result;
  }
}