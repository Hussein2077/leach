import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';

abstract class ProfileBaseRepository {
  Future<Either<PetProfileModel, Failure>> createPet (PetProfileModel petProfileModel);
  Future<Either<PendingFriendRequestsModel, Failure>> getPendingFriendRequests({required String page});
  Future<Either<String, Failure>> acceptFriendRequests({required String id});
  Future<Either<String, Failure>> rejectFriendRequests({required String id});
  Future<Either<FriendsModel, Failure>> getFriends({required String page});
  Future<Either<UserModel, Failure>> getMyData();
}
