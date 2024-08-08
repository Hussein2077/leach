import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/profile/widgets/posts_container.dart';
import 'package:leach/features/profile/presentation/widget/medals_abd_freinds.dart';
import 'package:leach/features/profile/presentation/widget/pet_or_profile.dart';
import 'package:leach/features/profile/presentation/widget/profile_app_bar.dart';
import 'package:leach/features/profile/presentation/widget/profile_user_row.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

import '../../../../core/resource_manager/routes.dart';

class PostsViewProfile extends StatefulWidget {
  const PostsViewProfile({super.key});

  @override
  State<PostsViewProfile> createState() => _PostsViewProfileState();
}

void _showEditDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DropdownButton2(
        alignment: Alignment.topCenter,


        items: [],
        // child:
        //
        //
        //
        //     Divider(
        //       color: Colors.black,
        //       height: 5,
        //       thickness: 0.6,
        //       indent: AppSize.defaultSize! * 2.2,
        //       endIndent: AppSize.defaultSize! * 2.8,
        //     ),
        //     SizedBox(
        //       height: AppSize.defaultSize! * 0.7,
        //     ),
        //     SideBarRow(
        //       image: AssetPath.messageX,
        //       text: StringManager.turnOffCommenting.tr(),
        //
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         // _showBlockDialog(context);
        //       },
        //     ),
        //     Divider(
        //       color: Colors.black,
        //       height: 5,
        //       thickness: 0.6,
        //       indent: AppSize.defaultSize! * 2.2,
        //       endIndent: AppSize.defaultSize! * 2.8,
        //     ),
        //     SizedBox(
        //       height: AppSize.defaultSize! * 0.7,
        //     ),
        //     SideBarRow(
        //       image: AssetPath.x,
        //       text: StringManager.deletePost.tr(),
        //
        //       onTap: () {
        //         Navigator.of(context).pop();
        //
        //       },
        //     ),
        //     Divider(
        //       color: Colors.black,
        //       height: 5,
        //       thickness: 0.6,
        //       indent: AppSize.defaultSize! * 2.2,
        //       endIndent: AppSize.defaultSize! * 2.8,
        //     ),


      );
    },
  );
}

class _PostsViewProfileState extends State<PostsViewProfile> {
  late List<SideBarRow> items;
  @override
  initState() {
    items = [
      SideBarRow(
        image: AssetPath.edit,
        text: StringManager.editPost.tr(),

        onTap: () {
          Navigator.pushNamed(context, Routes.trainYourDog);
          // _showReportDialog(context);


        },
      ),





    ];
    super.initState();


  }

  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        image: AssetPath.homeBackground,
        child: Column(
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            Padding(
              padding: Methods.instance.paddingCustom,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeadingIcon(
                    color: Colors.white,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.defaultSize! * 4),
                      topRight: Radius.circular(AppSize.defaultSize! * 4))),
                  child: Padding(
                    padding:   EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _showEditDialog(context);
                                },
                                icon: Image.asset(AssetPath.menuFriend,color: AppColors.primaryColor,),

                              ),
                            ],
                          ),
                          Image.asset(AssetPath.testPosts7),
                          SizedBox(
                            height: AppSize.defaultSize! * 2,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    isLiked = !isLiked;
                                    setState(() {});
                                  },
                                  borderRadius:
                                  BorderRadius.circular(AppSize.defaultSize! * 1.5),
                                  child: IconWithMaterial(
                                    imagePath: AssetPath.like,
                                    color: isLiked ? AppColors.primaryColor : null,
                                    elevation: 3,
                                    color2: isLiked ? Colors.white : null,
                                    width:  AppSize.defaultSize! * 2,
                                    height:  AppSize.defaultSize! * 2,
                                  )),
                              SizedBox(
                                width: AppSize.defaultSize!,
                              ),
                              InkWell(
                                  onTap: () {},
                                  borderRadius:
                                  BorderRadius.circular(AppSize.defaultSize! * 1.5),
                                  child:   IconWithMaterial(
                                    imagePath: AssetPath.comment,
                                    elevation: 3,
                                    width:  AppSize.defaultSize! * 2,
                                    height:  AppSize.defaultSize! * 2,
                                  )),

                            ],
                          ),
                        ],
                      );
                    }),
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
