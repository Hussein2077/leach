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

class AddPhotoForPet extends StatelessWidget {
  const AddPhotoForPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              DottedBorderCustom(
                text: StringManager.addPhoto.tr(),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Image.asset(
                        AssetPath.add,
                        width: AppSize.defaultSize! * 4,
                        height: AppSize.defaultSize! * 4,
                      ),
                      CustomText(
                        text: ' ${StringManager.addMorePhotos.tr()}',
                        color: AppColors.primaryColor,
                        fontSize: AppSize.defaultSize! * 3,
                      )
                    ],
                  )),
              SizedBox(
                height: AppSize.defaultSize! * 10,
              ),
              MainButton(
                text: StringManager.save.tr(),
                onTap: () {
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
