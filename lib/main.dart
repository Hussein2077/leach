import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/service/navigator_services.dart';
import 'package:leach/core/service/service_locator.dart';
import 'package:leach/core/translations/translations.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:leach/features/main_screen_bloc.dart';
import 'package:leach/features/posts/presentation/manager/comment_manager/comment_bloc.dart';
import 'package:leach/features/posts/presentation/manager/get_posts_manager/get_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/like_post_manager/like_post_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/dogBreadBloc/bloc.dart';
import 'package:leach/features/profile/presentation/controller/friends_manager/friends_bloc.dart';
import 'package:leach/features/profile/presentation/controller/my_data_manager/my_data_bloc.dart';
import 'package:leach/features/profile/presentation/controller/pending_friend_request_manager/pending_friend_request_bloc.dart';

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServerLocator().init();

  await EasyLocalization.ensureInitialized();
  token = await Methods.instance.returnUserToken();

  runApp(EasyLocalization(
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      assetLoader: CodegenLoader(),
      path: 'lib/core/translations/',
      saveLocale: true,
      child: Builder(builder: (context) {
        return const MyApp();
      })));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SignUpWithEmailAndPasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MainScreenBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetPostsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CommentBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<LikePostsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CreatePetBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<DogBreadCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetFriendRequestBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetFriendsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetMyDataBloc>(),
        ),
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        initialRoute: token == null || token == 'noToken' ? Routes.welcomePage : Routes.main,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Brodien',
            scaffoldBackgroundColor: const Color.fromRGBO(248, 250, 255, 1)),
      ),
    );
  }
}
