import 'package:get_it/get_it.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/features/auth/data/auth_remote_data_source.dart';
import 'package:leach/features/auth/data/repo_imp.dart';
import 'package:leach/features/auth/domain/repo/base_repo.dart';
import 'package:leach/features/auth/domain/use_case/change_password.dart';
import 'package:leach/features/auth/domain/use_case/delete_account_uc.dart';
import 'package:leach/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:leach/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/posts/data/data_source/posts_remote_data_source.dart';
import 'package:leach/features/posts/data/repo_imp/repo_imp.dart';
import 'package:leach/features/posts/domain/repo/base_repo.dart';
import 'package:leach/features/posts/domain/use_case/get_posts_uc.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_bloc.dart';

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
    getIt.registerLazySingleton(() => GetPostsBloc(getPostsUseCase: getIt()));

//use_case

    getIt.registerFactory(() => ResetPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => DeleteAccountUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => GetPostsUseCase(postsBaseRepository: getIt()));

    //remote data
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<PostsBaseRemotelyDataSource>(
            () => PostsRemotelyDateSource());

//repo
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<PostsBaseRepository>(
            () => PostsRepositoryImp(postsBaseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton(() => NavigationService());
  }
}
