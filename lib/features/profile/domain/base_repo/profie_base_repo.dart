import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/profile/domain/model/all_booking_model.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/domain/model/user_data_model.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/domain/use_case/update_my_data_use_case.dart';

abstract class ProfileBaseRepository {
  Future<Either<PetProfileModel, Failure>> createPet (PetProfileModel petProfileModel);
  Future<Either<PendingFriendRequestsModel, Failure>> getPendingFriendRequests({required String page});
  Future<Either<String, Failure>> sendFriendRequests({required String id});
  Future<Either<String, Failure>> acceptFriendRequests({required String id});
  Future<Either<String, Failure>> rejectFriendRequests({required String id});
  Future<Either<FriendsModel, Failure>> getFriends({required String page});
  Future<Either<UserModel, Failure>> getMyData();
  Future<Either<UserModel, Failure>> updateMyData (UpdateDataParams parameter);

  Future<Either<PetProfileModel, Failure>> updatePet (
      UpdatePetRequest petProfileModel);

  Future<Either<List<PetTrait>, Failure>> getTraits();
  Future<Either<String, Failure>>  changePrivacy();
  Future<Either<List<AllBookingModel>, Failure>>    getAllBooking();
  Future<Either<void, Failure>> cancelBooking   (  int bookingId );
  Future<Either<UserDataModel, Failure>> getUser({required String id});
  Future<Either<String, Failure>> removeFriend({required String id});
}

