  import 'package:dartz/dartz.dart';
import 'package:leach/core/error/failure.dart';
import 'package:leach/core/models/profile_data_model.dart';
import 'package:leach/features/auth/data/models/auth_with_apple_model.dart';
import 'package:leach/features/auth/data/models/auth_with_google_model.dart';
import 'package:leach/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';

abstract class BaseRepository {
  Future<Either<UserModel, Failure>> loginWithEmailAndPassword(
      AuthModel authModel);
  Future<Either<UserModel, Failure>> signUpWithEmailAndPassword(
      SignUpModel signUpModel);
  Future<Either<Map<String, dynamic>, Failure>> changePassword(
      SignUpModel signUpModel);
  Future<Either<String, Failure>> sendCode(
      SignUpModel signUpModel);
  Future<Either<Map<String, dynamic>, Failure>> verifyCode(
      SignUpModel signUpModel);

  Future<Either<String, Failure>> deleteAccount ( );

  Future<Either<AuthWithGoogleModel, Failure>> siginWithGoogle();

  Future<Either<AuthWithAppleModel, Failure>> siginWithApple();
}
