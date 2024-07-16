import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/core/widgets/snack_bar.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:leach/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';
import 'package:leach/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;


  @override
  void initState() {
    passwordController = TextEditingController();

    super.initState();


  }

  @override
  void dispose() {
  passwordController.dispose();

    super.dispose();
  }






  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return
    Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginWithEmailAndPasswordBloc,
            LoginWithEmailAndPasswordState>(
          listener: (context, state) {
            if (state is LoginWithEmailAndPasswordSuccessMessageState) {


            } else if (state is LoginWithEmailAndPasswordErrorMessageState) {


            } else if (state is LoginWithEmailAndPasswordLoadingState) {

            } else {

            }
          },
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
            child: Column(

            ),
          ),
        ),
      ),
    );
  }

}
