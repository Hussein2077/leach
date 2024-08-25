import 'package:leach/core/models/profile_data_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthWithAppleModel {
  final AuthorizationCredentialAppleID userData;
  final UserModel apiUserData;

  AuthWithAppleModel({required this.apiUserData, required this.userData});
}
