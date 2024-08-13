
class ConstantApi {
  static const String baseUrl = 'https://api.leashpets.com/api/leash/';

  static getImage(String url) => 'https://api.intrn.app/Intrn/Images/$url';

  static getPdf(String url) => 'https://api.intrn.app/Intrn/UsersCVs/$url';
  static const String signUp = "${baseUrl}register";
  static const String login = "${baseUrl}login";
  static const String createPet = "${baseUrl}pet";
  static   String updatePet(String id)  => "${baseUrl}pet/$id";
  static const String getTraits  = "${baseUrl}pet/traits";
  static getPosts(String page) => '${baseUrl}post/viewPosts?page=$page';
  static likePost(String id) {
    return "${baseUrl}post/likePost/$id";
  }
  static unLikePost(String id) {
    return "${baseUrl}post/removeLike/$id";
  }
  static addComments(String id) {
    return "${baseUrl}post/comment/$id";
  }


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
