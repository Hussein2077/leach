import 'package:leach/main.dart';

class ConstantApi {
  static const String baseUrl = 'https://api.intrn.app/Intrn/api/';

  static getImage(String url) => 'https://api.intrn.app/Intrn/Images/$url';

  static getPdf(String url) => 'https://api.intrn.app/Intrn/UsersCVs/$url';

  static const String login = "${baseUrl}NewAuth/LoginWithPhone";
  static const String deleteAccount = "${baseUrl}NewUserProfiles/DeleteUserProfileByUserId";
  static const String signUp = "${baseUrl}NewAuth/phone-signup";
  static const String sendCode = "${baseUrl}NewAuth/generate-phone-otp";
  static const String sendCodeToEmail =
      "${baseUrl}NewAuth/generate-otp-Register";
  static const String verifyCode = "${baseUrl}NewAuth/validate-otp-register";

  static const String universities = "${baseUrl}Universities/GetAllUniversity";
  static const String uploadPdf = "${baseUrl}UploadCV/upload-cv";
  static const String updatePdf = "${baseUrl}UploadCV/updateUserCV";

}
