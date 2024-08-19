import 'package:flutter/material.dart';
import 'package:leach/core/models/pet_model.dart';
import 'package:leach/core/resource_manager/enums.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/features/auth/presentation/forgot_password/code_page.dart';
import 'package:leach/features/auth/presentation/forgot_password/forgot_password.dart';
import 'package:leach/features/auth/presentation/forgot_password/reset_password_from_profile.dart';
import 'package:leach/features/auth/presentation/forgot_password/reset_password_screen.dart';
import 'package:leach/features/auth/presentation/login_screen.dart';
import 'package:leach/features/auth/presentation/sign_up/register.dart';
import 'package:leach/features/auth/presentation/welcome_screen.dart';
import 'package:leach/features/chat/chat_details.dart';
import 'package:leach/features/home/presentation/componant/booking.dart';
import 'package:leach/features/home/presentation/componant/breeding/breeding.dart';
import 'package:leach/features/home/presentation/componant/cash_or_credit.dart';
import 'package:leach/features/home/presentation/componant/how_to.dart';
import 'package:leach/features/home/presentation/componant/review.dart';
import 'package:leach/features/home/presentation/componant/select_how_to.dart';
import 'package:leach/features/home/presentation/componant/trainYourDog.dart';
import 'package:leach/features/home/presentation/doctors.dart';
import 'package:leach/features/home/presentation/widgets/calender.dart';
import 'package:leach/features/main_screen.dart';
import 'package:leach/features/posts/data/models/posts_model.dart';
import 'package:leach/features/profile/domain/model/create_pet.dart';
import 'package:leach/features/profile/presentation/add_pet/add_pet_screen.dart';
import 'package:leach/features/profile/presentation/add_pet/cat_bread.dart';
import 'package:leach/features/profile/presentation/add_pet/cat_breed3.dart';
import 'package:leach/features/profile/presentation/add_pet/dog_bread.dart';
import 'package:leach/features/profile/presentation/add_pet/dog_breed3.dart';
import 'package:leach/features/profile/presentation/add_pet/type_of_pet.dart';
import 'package:leach/features/profile/presentation/friends/friends_screen.dart';
import 'package:leach/features/profile/presentation/friends/friends_view.dart';
import 'package:leach/features/profile/presentation/friends/report.dart';
import 'package:leach/features/profile/presentation/friends/specific_messages_report.dart';
import 'package:leach/features/profile/presentation/friends/submit_report.dart';
import 'package:leach/features/profile/presentation/notifications/friend_requests_screen.dart';
import 'package:leach/features/profile/presentation/notifications/notifications_screen.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/edit_post.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/posts_view_profile.dart';
import 'package:leach/features/profile/presentation/profile/componant/account_privacy.dart';
import 'package:leach/features/profile/presentation/profile/componant/activity_and_history.dart';
import 'package:leach/features/profile/presentation/profile/componant/add_photo_for_pet.dart';
import 'package:leach/features/profile/presentation/profile/componant/add_post.dart';
import 'package:leach/features/profile/presentation/profile/componant/booking_history.dart';
import 'package:leach/features/profile/presentation/profile/componant/delete_account.dart';
import 'package:leach/features/profile/presentation/profile/componant/edit_pet_profile.dart';
import 'package:leach/features/profile/presentation/profile/my_pet_profile.dart';
import 'package:leach/features/profile/presentation/profile/pet_details.dart';
import 'package:leach/features/profile/presentation/profile/side_bar.dart';
import 'package:leach/features/profile/presentation/profile/componant/edit_profile.dart';

import 'package:leach/features/profile/presentation/profile/componant/delete_account_2.dart';

class Routes {
  static const String login = "/login";
  static const String welcomePage = "/welcomePage";
  static const String splash = "/splash";
  static const String main = "/main";
  static const String signUp = "/signUp";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpCode = "/otpCode";
  static const String resetPassword = "/resetPassword";
  static const String addPetScreen = "/addPetScreen";
  static const String typeOfPetScreen = "/TypeOfPetScreen";
  static const String catBread = "/CatBread";
  static const String dogBread = "/dogBread";
  static const String doctor = "/Doctors";
  static const String catBreed3 = "/CatBreed3";
  static const String dogBreed3 = "/dogBreed3";
  static const String sidebar = "/side_bar";
  static const String breedingScreen = "/BreedingScreen";
  static const String bookingScreen = "/BookingScreen";
  static const String petDetails = "/petDetails";
  static const String accountPrivacy = "/account_privacy";
  static const String activityAndHistory = "/activity_and_history";

  static const String myPetProfile = "/my_pet_profile";
  static const String editProfile = "/edit_profile";
  static const String editPetProfile = "/edit_pet_profile";
  static const String deleteAccount = "/delete_account";
  static const String deleteAccount2 = "/delete_account_2";
  static const String calenderScreen = "/CalenderScreen";
  static const String reviewScreen = "/ReviewScreen";
  static const String cashOrCredit = "/cashOrCredit";
  static const String chatDetails = "/ChatDetails";
  static const String friends = "/friends";
  static const String friendsView = "/friendsView";
  static const String postsViewProfile = "/PostsViewProfile";
  static const String addPost = "/addPost";
  static const String addPhotoForPet = "/AddPhotoForPet";
  static const String howTo = "/howTo";
  static const String resetPasswordFromProfile = "/reset_password_from_profile";
  static const String specificMessagesReport = "/specific_messages_report";
  static const String submitReport = "/submit_report";
  static const String reportView = "/report_view";
  static const String selectHowTo = "/select_how_to";
  static const String trainYourDog = "/train_your_dog";
  static const String notification = "/notification_screen";
  static const String friendRequests = "/friend_requests";
  static const String editPost = "/edit_post";
  static const String bookingHistory = "/booking_history";

}

class RouteGenerator {
  static bool isStudent = false;

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: customAnimate);
      case Routes.main:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder: customAnimate);
      case Routes.welcomePage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const WelcomePage(),
            transitionsBuilder: customAnimate);
      case Routes.signUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: customAnimate);
      case Routes.forgotPasswordScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgotPasswordScreen(),
            transitionsBuilder: customAnimate);
      case Routes.otpCode:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CodeScreen(),
            transitionsBuilder: customAnimate);
      case Routes.resetPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResetPasswordScreen(),
            transitionsBuilder: customAnimate);
      case Routes.addPetScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AddPetScreen(),
            transitionsBuilder: customAnimate);
      case Routes.typeOfPetScreen:
        TypeOfPetNavigator typeOfPetNavigator =
            settings.arguments as TypeOfPetNavigator;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                TypeOfPetScreen(
                  typeOfPetNavigator: typeOfPetNavigator,
                ),
            transitionsBuilder: customAnimate);
      case Routes.doctor:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Doctors(),
            transitionsBuilder: customAnimate);
      case Routes.catBread:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CatBread(),
            transitionsBuilder: customAnimate);
      case Routes.dogBread:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DogBread(),
            transitionsBuilder: customAnimate);

      case Routes.dogBreed3:
        PetProfileModel petProfileModel = settings.arguments as PetProfileModel;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => DogBreed3(
                  petProfileModel: petProfileModel,
                ),
            transitionsBuilder: customAnimate);
      case Routes.catBreed3:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CatBreed3(),
            transitionsBuilder: customAnimate);
      case Routes.sidebar:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SideBar(),
            transitionsBuilder: customAnimate);
      case Routes.petDetails:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const PetDetails(),
            transitionsBuilder: customAnimate);
      case Routes.accountPrivacy:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AccountPrivacy(),
            transitionsBuilder: customAnimate);
      case Routes.activityAndHistory:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ActivityAndHistory(),
            transitionsBuilder: customAnimate);
      case Routes.myPetProfile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyPetProfile(),
            transitionsBuilder: customAnimate);
      case Routes.editProfile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const EditProfile(),
            transitionsBuilder: customAnimate);
      case Routes.breedingScreen:
        String type = settings.arguments as String;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => BreedingScreen(type: type),
            transitionsBuilder: customAnimate);
      case Routes.editPetProfile:
        Pet currentPet = settings.arguments as Pet;

        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                EditPetProfile(
                  currentPet: currentPet,
                ),
            transitionsBuilder: customAnimate);
      case Routes.deleteAccount:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DeleteAccount(),
            transitionsBuilder: customAnimate);
      case Routes.calenderScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CalenderScreen(),
            transitionsBuilder: customAnimate);
      case Routes.reviewScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ReviewScreen(),
            transitionsBuilder: customAnimate);
      case Routes.cashOrCredit:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CashOrCredit(),
            transitionsBuilder: customAnimate);
      case Routes.bookingScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const BookingScreen(),
            transitionsBuilder: customAnimate);
      case Routes.chatDetails:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChatDetails(),
            transitionsBuilder: customAnimate);
      case Routes.deleteAccount2:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DeleteAccount2(),
            transitionsBuilder: customAnimate);
      case Routes.friends:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const FriendsScreen(),
            transitionsBuilder: customAnimate);
      case Routes.friendsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const FriendsView(),
            transitionsBuilder: customAnimate);
      case Routes.postsViewProfile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const PostsViewProfile(),
            transitionsBuilder: customAnimate);
      case Routes.addPost:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => AddPost(),
            transitionsBuilder: customAnimate);
      case Routes.addPhotoForPet:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AddPhotoForPet(),
            transitionsBuilder: customAnimate);
      case Routes.howTo:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HowTo(),
            transitionsBuilder: customAnimate);
      case Routes.resetPasswordFromProfile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResetPasswordScreenFromProfile(),
            transitionsBuilder: customAnimate);
      case Routes.specificMessagesReport:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SpecificMessagesReport(),
            transitionsBuilder: customAnimate);
      case Routes.submitReport:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SubmitReport(),
            transitionsBuilder: customAnimate);
      case Routes.reportView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ReportView(),
            transitionsBuilder: customAnimate);
      case Routes.selectHowTo:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SelectHowTo(),
            transitionsBuilder: customAnimate);
      case Routes.trainYourDog:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const TrainYourDog(),
            transitionsBuilder: customAnimate);
      case Routes.notification:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NotificationsScreen(),
            transitionsBuilder: customAnimate);
      case Routes.friendRequests:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const FriendRequestsScreen(),
            transitionsBuilder: customAnimate);
      case Routes.editPost:
        PostData postData = settings.arguments as PostData;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => EditPost(data: postData),
            transitionsBuilder: customAnimate);
      case Routes.bookingHistory:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const BookingHistory(),
            transitionsBuilder: customAnimate);
    }
    return unDefinedRoute(
        getIt<NavigationService>().navigatorKey.currentContext!);
  }

  static Route<dynamic> unDefinedRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => WillPopScope(
        onWillPop: () async {
          bool leaveApp = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Confirm Exit'),
              content: const Text('Are you sure you want to leave the app?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.main,
                      (route) => false,
                    );
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Exit'),
                ),
              ],
            ),
          );
          return leaveApp;
        },
        child: Container(),
      ),
    );
  }
}

Widget customAnimate(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // var begin = Offset(1.0, 0.0);
  // var end = Offset.zero;
  // var curve = Curves.decelerate;
  //
  // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
