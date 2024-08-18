import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/background.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/profile/presentation/widget/side_bar_row.dart';

import '../../../../core/resource_manager/routes.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late List<SideBarRow> items;
  SideBarRow? selectedValue;

  @override
  void initState() {
    super.initState();
  }

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
                  color: Color.fromRGBO(246, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.defaultSize! * 4),
                    topRight: Radius.circular(AppSize.defaultSize! * 4),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 3),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: AppSize.defaultSize! * 1.3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                AssetPath.menuFriend,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.defaultSize! * 3),
                        SideBarRow(

                          image: AssetPath.edit,
                          text: StringManager.editPost.tr(),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editPost);
                          },
                        ),
                        Divider(
                          color: Colors.black,
                          height: 5,
                          thickness: 0.6,
                          indent: AppSize.defaultSize! * 2.2,
                          endIndent: AppSize.defaultSize! * 2.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: AppSize.defaultSize! * 3,
                            ),
                          ],
                        ),
                        Image.asset(AssetPath.testPosts7),
                        SizedBox(
                          height: AppSize.defaultSize! * 2,
                        ),
                        CustomTextField(
                          width: AppSize.screenWidth! * .8,
                          height: AppSize.defaultSize! * 2.6,
                          hintText: StringManager.editCaption.tr(),
                        ),
                        SizedBox(height: AppSize.defaultSize! * 9),
                        MainButton(
                          text: StringManager.save.tr(),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,
                        ),

                        SizedBox(
                          height: AppSize.defaultSize! * 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
