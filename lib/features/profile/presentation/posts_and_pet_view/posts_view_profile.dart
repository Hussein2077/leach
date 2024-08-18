import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

import '../../../../core/resource_manager/routes.dart';

class PostsViewProfile extends StatefulWidget {
  const PostsViewProfile({super.key});

  @override
  State<PostsViewProfile> createState() => _PostsViewProfileState();
}

class _PostsViewProfileState extends State<PostsViewProfile> {
  late List<SideBarRow> items;
  SideBarRow? selectedValue;
  bool isSwitched = false;
  List<DropdownMenuItem<SideBarRow>> _addDividersAfterItems(List<SideBarRow> items) {
    final List<DropdownMenuItem<SideBarRow>> menuItems = [];
    for (final SideBarRow item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<SideBarRow>(
            value: item,
            child: item,
          ),


        ],
      );
    }
    return menuItems;
  }

  void _showTurnOffCommentingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.fromLTRB(0, 0, 0, AppSize.defaultSize!*36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
          ),
          contentPadding: EdgeInsets.all(AppSize.defaultSize! * 3),
          backgroundColor: Color.fromRGBO(246, 255, 255, 1),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SideBarRow(

                  image: AssetPath.messageX,
                  text: StringManager.turnOffCommenting.tr(),

                  onTap: () {
                  },
                ),

                Divider(),


                Row(

                  children: [
                    Transform.scale(
                      scale: AppSize.defaultSize! * 0.08,
                      child: Switch(
                        // thumb color (round icon)

                        activeColor: Colors.blue,
                        activeTrackColor: Colors.white,
                        inactiveThumbColor: Colors.blue,
                        inactiveTrackColor: Colors.white,

                        // boolean variable value
                        value: isSwitched,
                        // changes the state of the switch
                        onChanged: (value) {
                          // BlocProvider.of<GetMyDataBloc>(context).add(
                          //     ChangePrivacyEvent());
                          // setState(() {
                          //   isSwitched = value;
                          // });
                        },
                      ),
                    ),
                    CustomText(text: StringManager.turnOff.tr(),fontSize: AppSize.defaultSize! * 2,

                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  void initState() {
    items = [
      // SideBarRow(
      //   isMenu: true,
      //   onTap: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
      SideBarRow(
        textSize: AppSize.defaultSize! * 2,
        image: AssetPath.edit,
        text: StringManager.editPost.tr(),
        onTap: () {
          Navigator.pushNamed(context, Routes.editPost);
        },
      ),
      SideBarRow(
        textSize: AppSize.defaultSize! * 2,
        image: AssetPath.messageX,
        text: StringManager.turnOffCommenting.tr(),
        onTap: () {
          Navigator.of(context).pop();
          _showTurnOffCommentingDialog(context);
        },
      ),
      SideBarRow(
        textSize: AppSize.defaultSize! * 2,
        image: AssetPath.x,
        text: StringManager.deletePost.tr(),
        onTap: () {
          Navigator.of(context).pop();
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
                  color:  Color.fromRGBO(246, 255, 255,1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.defaultSize! * 4),
                    topRight: Radius.circular(AppSize.defaultSize! * 4),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: AppSize.defaultSize!  * 3,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<SideBarRow>(
                                  customButton: Image.asset(
                                    AssetPath.menuFriend,
                                    color: AppColors.primaryColor,
                                  ),
                                  items: _addDividersAfterItems(items),
                                  value: selectedValue,
                                  onChanged: (SideBarRow? value) {
                                    setState(() {
                                      selectedValue = value;
                                      value?.onTap?.call();
                                    });
                                  },
                                  dropdownStyleData: DropdownStyleData(

                                    width: AppSize.screenWidth!,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
                                      color: const Color.fromRGBO(246, 255, 255,1),
                                    ),


                                  ),

                                ),
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
                                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                                child: IconWithMaterial(
                                  imagePath: AssetPath.like,
                                  color: isLiked ? AppColors.primaryColor : null,
                                  elevation: 3,
                                  color2: isLiked ? Colors.white : null,
                                  width: AppSize.defaultSize! * 2,
                                  height: AppSize.defaultSize! * 2,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.defaultSize!,
                              ),
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(AppSize.defaultSize! * 1.5),
                                child: IconWithMaterial(
                                  imagePath: AssetPath.comment,
                                  elevation: 3,
                                  width: AppSize.defaultSize! * 2,
                                  height: AppSize.defaultSize! * 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
