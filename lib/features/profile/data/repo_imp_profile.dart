import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/core/utils/api_helper.dart';
import 'package:leach/features/profile/data/profile_remote_data_source.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/domain/model/traits_model.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/domain/model/friends_model.dart';
import 'package:leach/features/profile/domain/model/pending_friend_requests_model.dart';
import 'package:leach/features/profile/domain/use_case/update_my_data_use_case.dart';

class ProfileRepositoryImp extends ProfileBaseRepository {
  final ProfileBaseRemotelyDataSource profileBaseRemotelyDataSource;

  ProfileRepositoryImp({required this.profileBaseRemotelyDataSource});

  @override
  Future<Either<PetProfileModel, Failure>> createPet(PetProfileModel petProfileModel)async {
    try {
      final result =
          await profileBaseRemotelyDataSource.createPet(petProfileModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<PetProfileModel, Failure>> updatePet (UpdatePetRequest petProfileModel)async {
    try {
      final result =
          await profileBaseRemotelyDataSource.updatePet(petProfileModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<PetTrait>, Failure>>  getTraits()async {
    try {
      final result =
          await profileBaseRemotelyDataSource.getTraits();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<PendingFriendRequestsModel, Failure>> getPendingFriendRequests({required String page}) async {
    try {
      final result = await profileBaseRemotelyDataSource.getPendingFriendRequests(page: page);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> acceptFriendRequests({required String id}) async {
    try {
      final result = await profileBaseRemotelyDataSource.acceptFriendRequests(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> rejectFriendRequests({required String id}) async {
    try {
      final result = await profileBaseRemotelyDataSource.rejectFriendRequests(id: id);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<FriendsModel, Failure>> getFriends({required String page}) async {
    try {
      final result = await profileBaseRemotelyDataSource.getFriends(page: page);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<UserModel, Failure>> getMyData() async {
    try {
      final result = await profileBaseRemotelyDataSource.getMyData();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<UserModel, Failure>> updateMyData(UpdateDataParams parameter) async {
    try {
      final result = await profileBaseRemotelyDataSource.updateMyData(parameter);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> changePrivacy() async{
    try {
      final result = await profileBaseRemotelyDataSource.changePrivacy();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

}