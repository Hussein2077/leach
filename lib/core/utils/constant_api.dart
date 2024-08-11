import 'package:leach/main.dart';

class ConstantApi {
  static const String baseUrl = 'https://api.leashpets.com/api/leash/';

  static getImage(String url) => 'https://api.intrn.app/Intrn/Images/$url';

  static getPdf(String url) => 'https://api.intrn.app/Intrn/UsersCVs/$url';
  static const String signUp = "${baseUrl}register";
  static const String login = "${baseUrl}login";

//////////////////////////////
  static const String deleteAccount = "${baseUrl}New";
  static const String sendCode = "${baseUrl}NewAu";
  static const String sendCodeToEmail =
      "$baseUrl s";
  static const String verifyCode = "${baseUrl}NewA";

  static const String universities = "${baseUrl}Un";
  static const String uploadPdf = "${baseUrl}Up";
  static const String updatePdf = "${baseUrl}Up";

}
