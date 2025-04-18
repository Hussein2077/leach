import 'package:get_it/get_it.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/features/auth/data/auth_remote_data_source.dart';
import 'package:leach/features/auth/data/repo_imp.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';
import 'package:leach/features/auth/domain/use_case/change_password.dart';
import 'package:leach/features/auth/domain/use_case/delete_account_uc.dart';
import 'package:leach/features/auth/domain/use_case/google_sign_in_usecase.dart';
import 'package:leach/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:leach/features/auth/domain/use_case/send_code.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:leach/features/auth/domain/use_case/sign_with_apple_us.dart';
import 'package:leach/features/auth/domain/use_case/verify_code.dart';
import 'package:leach/features/auth/presentation/controller/change_password_bloc/change_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/sign_in_with_paltform_manager/sign_in_with_platform_bloc.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:leach/features/home/data/data_source/home_remote_data_source.dart';
import 'package:leach/features/home/data/repo_imp/repo_imp.dart';
import 'package:leach/features/home/domain/repo/base_repo.dart';
import 'package:leach/features/home/domain/use_case/get_breeding_uc.dart';
import 'package:leach/features/home/domain/use_case/get_search_user_uc.dart';
import 'package:leach/features/home/domain/use_case/get_vendors_use_case.dart';
import 'package:leach/features/home/domain/use_case/how_to_uc.dart';
import 'package:leach/features/home/domain/use_case/request_booking_uc.dart';
import 'package:leach/features/home/presentation/manager/get_breeding_manager/get_breeding_bloc.dart';
import 'package:leach/features/home/presentation/manager/get_vendor/bloc.dart';
import 'package:leach/features/home/presentation/manager/how_to/bloc.dart';
import 'package:leach/features/home/presentation/manager/search_bloc/bloc.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/posts/data/data_source/posts_remote_data_source.dart';
import 'package:leach/features/posts/data/repo_imp/repo_imp.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';
import 'package:leach/features/posts/domain/use_case/add_comment_uc.dart';
import 'package:leach/features/posts/domain/use_case/create_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/delete_comment_uc.dart';
import 'package:leach/features/posts/domain/use_case/delete_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/edit_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_comments_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_posts_uc.dart';
import 'package:leach/features/posts/domain/use_case/get_user_posts_uc.dart';
import 'package:leach/features/posts/domain/use_case/like_post_uc.dart';
import 'package:leach/features/posts/domain/use_case/un_like_post_uc.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/delete_comment_manager/delete_comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/profile/data/profile_remote_data_source.dart';
import 'package:leach/features/profile/data/repo_imp_profile.dart';
import 'package:leach/features/profile/domain/base_repo/profie_base_repo.dart';
import 'package:leach/features/profile/domain/use_case/CREATE_PET_USE_CASE.dart';
import 'package:leach/features/profile/domain/use_case/accept_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/add_photo_for_pet.dart';
import 'package:leach/features/profile/domain/use_case/block_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/change_privacy_use_case.dart';
import 'package:leach/features/profile/domain/use_case/get_all_booking_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_friends_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_my_data_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_pending_friend_requests_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/reject_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/get_traits_use_case.dart';
import 'package:leach/features/profile/domain/use_case/remove_friend_uc.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/sned_friend_request_uc.dart';
import 'package:leach/features/profile/domain/use_case/un_block_user_uc.dart';
import 'package:leach/features/profile/domain/use_case/update_my_data_use_case.dart';
import 'package:leach/features/profile/presentation/controller/booking/bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/dogBreadBloc/bloc.dart';
import 'package:leach/features/profile/presentation/controller/get_traits/bloc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_bloc.dart';
import 'package:leach/features/profile/presentation/controller/get_user_manager/get_user_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';
import 'package:leach/features/profile/presentation/controller/report_user/bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerLazySingleton(() => LoginWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt(),
        deleteAccountUseCase: getIt()));
    getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordBloc(
          signUpWithEmailAndPasswordUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => MainScreenBloc());
    getIt.registerLazySingleton(() => PostsBloc(getPostsUseCase: getIt()));
    getIt.registerLazySingleton(() => UserPostsBloc(
        getUserPostsUseCase: getIt(),
        deleteUserPostUseCase: getIt(),
        editeUserPostUc: getIt(),
        createUserPostUseCase: getIt()));
    getIt.registerLazySingleton(() => CommentBloc(addCommentUseCase: getIt(), getCommentsUseCase: getIt()));
    getIt.registerLazySingleton(
        () => LikePostsBloc(likePostUc: getIt(), unLikePostUc: getIt()));
    getIt.registerLazySingleton(() =>
        CreatePetBloc(createPetUseCase: getIt(), updatePetUseCase: getIt(),addPhotoForPetUseCase: getIt(),));
    getIt.registerLazySingleton(() => BaseBreadCubit());
    getIt.registerLazySingleton(() => GetFriendRequestBloc(
        getFriendRequestUseCase: getIt(),
        acceptFriendRequestsUseCase: getIt(),
        rejectFriendRequestsUseCase: getIt(), removeFriendUseCase: getIt(), sendFriendRequestsUseCase: getIt(), blockUserUseCase: getIt(), unBlockUserUseCase: getIt(),));
    getIt.registerLazySingleton(
        () => GetFriendsBloc(getFriendsUseCase: getIt()));
    getIt.registerLazySingleton(() => GetMyDataBloc(
        getMyDataUseCase: getIt(),
        changePrivacyUseCase: getIt(),
        updateMyDataUseCase: getIt()));
    getIt.registerLazySingleton(() => GetTraitsBloc(getTraitUseCase: getIt()));
    getIt.registerLazySingleton(
        () => DeleteCommentBloc(deleteCommentUseCase: getIt()));
    getIt
        .registerLazySingleton(() => BreedingBloc(getBreedingUseCase: getIt()));
    getIt.registerLazySingleton(() => VendorsBloc(
          getVendorsUseCase: getIt(),
          requestBookingUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => BookingBloc(
        cancelBookingUseCase: getIt(), getAllBookingUseCase: getIt()));
    getIt.registerLazySingleton(() => HowToBloc(getHowToUseCase: getIt()));
    getIt.registerLazySingleton(() => ChangePasswordFlowBloc(
        changePasswordUseCase: getIt(),
        verifyCodeUseCase: getIt(),
        sendCodeUseCase: getIt()));
    getIt.registerLazySingleton(() => GetUserBloc(getUserUseCase: getIt()));
    getIt.registerLazySingleton(() => ReportUserBloc(reportUserUseCase: getIt()));
    getIt.registerLazySingleton(() => GetSearchUserBloc(getSearchUserUseCase: getIt()));
    getIt.registerLazySingleton(() => SignInWithPlatformBloc(signInWithAppleUC: getIt(), signInWithGoogleUC: getIt()));

    //use_case
    getIt.registerFactory(() => SignInWithAppleUC(baseRepository: getIt()));
    getIt.registerFactory(() => BlockUserUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => UnBlockUserUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => SignInWithGoogleUC(baseRepository: getIt()));
    getIt.registerFactory(() => GetUserUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => ChangePasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => VerifyCodeUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => SendCodeUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => DeleteCommentUseCase(postsBaseRepository: getIt()));
    getIt.registerFactory(() => EditePostUc(postsBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetUserPostsUseCase(postsBaseRepository: getIt()));
    getIt
        .registerFactory(() => CreatePostUseCase(postsBaseRepository: getIt()));
    getIt
        .registerFactory(() => DeletePostUseCase(postsBaseRepository: getIt()));
    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => DeleteAccountUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => GetPostsUseCase(postsBaseRepository: getIt()));
    getIt
        .registerFactory(() => AddCommentUseCase(postsBaseRepository: getIt()));
    getIt.registerFactory(() => LikePostUc(postsBaseRepository: getIt()));
    getIt.registerFactory(() => UnLikePostUc(postsBaseRepository: getIt()));
    getIt.registerFactory(
        () => CreatePetUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetPendingFriendRequestsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => AcceptFriendRequestsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => RejectFriendRequestsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => SendFriendRequestsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => RemoveFriendUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetFriendsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetMyDataUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => UpdateMyDataUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetTraitsUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => UpdatePetUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => ChangePrivacyUseCase(profileBaseRepository: getIt()));
    getIt
        .registerFactory(() => GetBreedingUseCase(homeBaseRepository: getIt()));
    getIt.registerFactory(() => GetVendorsUseCase(homeBaseRepository: getIt()));
    getIt.registerFactory(
        () => RequestBookingUseCase(homeBaseRepository: getIt()));
    getIt.registerFactory(
        () => CancelBookingUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(
        () => GetAllBookingUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => GetHowToUseCase(homeBaseRepository: getIt()));
    getIt.registerFactory(() => AddPhotoForPetUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => GetCommentsUseCase(postsBaseRepository: getIt()));
    getIt.registerFactory(() => ReportUserUseCase(profileBaseRepository: getIt()));
    getIt.registerFactory(() => GetSearchUserUseCase(baseRepository: getIt()));

    //remote data
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<PostsBaseRemotelyDataSource>(
        () => PostsRemotelyDateSource());
    getIt.registerLazySingleton<ProfileBaseRemotelyDataSource>(
        () => ProfileRemotelyDateSource());
    getIt.registerLazySingleton<HomeBaseRemotelyDataSource>(
        () => HomeRemotelyDateSource());

    //repo
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<ProfileBaseRepository>(
        () => ProfileRepositoryImp(profileBaseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<PostsBaseRepository>(
        () => PostsRepositoryImp(postsBaseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<HomeBaseRepository>(
        () => HomeRepositoryImp(homeBaseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton(() => NavigationService());
  }
}
