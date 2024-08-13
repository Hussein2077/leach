import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';

class GetPendingFriendRequestsUseCase extends BaseUseCase<PendingFriendRequestsModel, String> {
  ProfileBaseRepository profileBaseRepository;
  GetPendingFriendRequestsUseCase({required this.profileBaseRepository});

  @override
  Future<Either<PendingFriendRequestsModel, Failure>> call(String parameter) async {
    final result = await profileBaseRepository.getPendingFriendRequests(page: parameter);
    return result;
  }
}
