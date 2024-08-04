import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class SizeRow extends StatelessWidget {
  const SizeRow({super.key,   this.isDog=false});
final bool isDog ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: AppSize.screenHeight! * .9,
      height: AppSize.defaultSize! * 11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
padding: EdgeInsets.zero,

        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: AppSize.defaultSize!  ),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  child: Container(
                    width: AppSize.defaultSize! * 8.2,
                    height: AppSize.defaultSize! * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                      color: Colors.white,
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:   EdgeInsets. only(bottom:  AppSize.defaultSize!*.4),
                          child: Image.asset( AssetPath.listCat[index].toString() ,),
                        )),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! ,),
                CustomText(text: !isDog?StringManager.sizeList[index].toString():StringManager.sizeListDog[index].toString(),
                fontSize: AppSize.defaultSize! *1.4 ,
                color: AppColors.greyColor

                ),

              ],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
