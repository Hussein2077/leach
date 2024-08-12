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
  @override
  void initState() {
    //token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5sZWFzaHBldHMuY29tL2FwaS9sZWFzaC9sb2dpbiIsImlhdCI6MTcyMzM4NjgzOCwiZXhwIjoxNzI0NTk2NDM4LCJuYmYiOjE3MjMzODY4MzgsImp0aSI6Imw5SjI0N1F0RFIycXJhUUoiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Z91Vct-WoqLUmJdo2UFKhqGqJG5zUVC-6TMMP98wMMo";
    super.initState();
  }

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
