
class ConstantApi {
  static const String baseUrl = 'https://api.leashpets.com/api/leash/';

  static getImage(String url) => 'https://api.intrn.app/Intrn/Images/$url';

  static getPdf(String url) => 'https://api.intrn.app/Intrn/UsersCVs/$url';
  static const String signUp = "${baseUrl}register";
  static const String login = "${baseUrl}login";
  static const String createPet = "${baseUrl}pet";
  static   String updatePet(String id)  => "${baseUrl}pet/$id";
  static const String getTraits  = "${baseUrl}pet/traits";
  static const String getMyData = "${baseUrl}user";
  static const String updateMyData  = "${baseUrl}user/update";
  static const String togglePrivacy  = "${baseUrl}user/togglePrivacy";
  static const String requestBooking   = "${baseUrl}user/requestBooking";
  static const String getAllBooking    = "${baseUrl}user/listAllBookings";
  static const String getHowToPosts     = "${baseUrl}user/howToPosts";
  static const String changePassword      = "${baseUrl}user/changePassword";
  static const String deleteAccount = "${baseUrl}user";

  static   String cancelBooking (String id)   => "${baseUrl}user/cancelBooking/$id";
  static getPosts(String page) => '${baseUrl}post/viewPosts?page=$page';
  static getUserPosts(String page) => '${baseUrl}post?page=$page';
  static likePost(String id) {
    return "${baseUrl}post/likePost/$id";
  }
  static unLikePost(String id) {
    return "${baseUrl}post/removeLike/$id";
  }
  static addComments(String id) {
    return "${baseUrl}post/comment/$id";
  }
  static getPendingFriendRequests(String page) {
    return "${baseUrl}user/pending_friend_requests?page=$page";
  }
  static sendFriendRequests(String id) {
    return "${baseUrl}user/friendRequest/$id";
  }
  static acceptFriendRequests(String id) {
    return "${baseUrl}user/acceptFriendRequest/$id";
  }
  static rejectFriendRequests(String id) {
    return "${baseUrl}user/friendRequest/$id";
  }
  static getFriends(String page) {
    return "${baseUrl}user/listAllFriends?page=$page";
  }
  static deletePost(String id) {
    return "${baseUrl}post/$id";
  }
  static deleteComment(String id) {
    return "${baseUrl}post/comment/$id";
  }
  static editePost(String id) {
    return "${baseUrl}post/$id";
  }
  static const String createPost = "${baseUrl}post";

  static getBreeding({required String type, required String page}) {
    return "${baseUrl}breeding?pet_type=$type&page=$page";
  }
  static getVendors({required String type, }) {
    return "${baseUrl}user/vendors/$type";
  }
  static getUser({required String id}) {
    return "${baseUrl}user/viewUser/$id";
  }
  static removeFriend({required String id}) {
    return "${baseUrl}user/removeFriend/$id";
  }

//////////////////////////////
  static const String sendCode = "${baseUrl}NewAu";
  static const String sendCodeToEmail =
      "$baseUrl s";
  static const String verifyCode = "${baseUrl}NewA";

  static const String universities = "${baseUrl}Un";
  static const String uploadPdf = "${baseUrl}Up";
  static const String updatePdf = "${baseUrl}Up";

}
