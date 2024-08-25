import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/loading_widget.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/posts_manager/posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_bloc.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_event.dart';
import 'package:leach/features/posts/presentation/manager/user_posts_manager/user_posts_state.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/card_widget.dart';
import 'package:leach/features/profile/presentation/posts_and_pet_view/plain_card.dart';

class PetPhotoView extends StatefulWidget {
  const PetPhotoView({super.key});

  @override
  State<PetPhotoView> createState() => _PetPhotoViewState();
}

class _PetPhotoViewState extends State<PetPhotoView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundScreen(
          image: AssetPath.homeBackground,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: Methods.instance.paddingCustom,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:AppSize.defaultSize! * 5.5,left:AppSize.defaultSize! * 2.5,),
                        child: LeadingIcon(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 3,
                ),
                Expanded(
                  child: Container(
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.defaultSize! * 4),
                        topRight: Radius.circular(AppSize.defaultSize! * 4),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.defaultSize! * 3),
                      child: BlocBuilder<UserPostsBloc, UserPostState>(
                        builder: (context, state) {


                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return const PlainCard(

                                  );
                                },
                              );



                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  }
}
