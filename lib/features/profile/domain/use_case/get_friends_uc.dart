import 'package:dartz/dartz.dart';
import 'package:leach/core/base_use_case/base_use_case.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';

class GetFriendsUseCase extends BaseUseCase<FriendsModel, String> {
  ProfileBaseRepository profileBaseRepository;
  GetFriendsUseCase({required this.profileBaseRepository});

  @override
  Future<Either<FriendsModel, Failure>> call(String parameter) async {
    final result = await profileBaseRepository.getFriends(page: parameter);
    return result;
  }
}
