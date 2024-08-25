import 'package:google_sign_in/google_sign_in.dart';
import 'package:leach/core/models/profile_data_model.dart';

class AuthWithGoogleModel {
  final GoogleSignInAccount userData;
  final UserModel apiUserData;

  AuthWithGoogleModel({required this.apiUserData, required this.userData});
}
