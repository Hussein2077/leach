import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';

class RejectFriendRequestsUseCase extends BaseUseCase<String, String> {
  ProfileBaseRepository profileBaseRepository;
  RejectFriendRequestsUseCase({required this.profileBaseRepository});

  @override
  Future<Either<String, Failure>> call(String parameter) async {
    final result = await profileBaseRepository.rejectFriendRequests(id: parameter);
    return result;
  }
}
