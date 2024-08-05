import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/cutom_text.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:leach/core/widgets/main_button.dart';
import 'package:leach/features/profile/presentation/profile/widgets/dottet_border_custom.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child: Padding(
          padding: Methods.instance.paddingCustom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingIcon(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              const DottedBorderCustom(),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
                Align(
                    alignment: Alignment.topRight,
                    child: CustomText(text: StringManager.optional.tr(),
                    color: AppColors.greyColor,
                      fontFamily: 'Gully',
                      fontSize: AppSize.defaultSize! * 1,
                    )),
              SizedBox(
                height: AppSize.defaultSize! * 1,
              ),
              CustomTextField(
                hintText: StringManager .writeCaption.tr(),

                maxLines: 1,
                suffixIcon: Image.asset(AssetPath.chat,color: AppColors.primaryColor,
               scale: AppSize.defaultSize! * 0.15,

                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 10,
              ),
              MainButton(text: StringManager.post.tr(),onTap: (){
                Navigator.pop(context);
              },
              textColor: Colors.white,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
