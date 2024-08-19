import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/core/widgets/icon_with_matrial.dart';

import 'comment_row.dart';

void showHalfPageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    // Makes the background of the bottom sheet transparent
    isScrollControlled: true,
    // Allows the bottom sheet to take a custom height
    builder: (BuildContext context) {
      return Container(
        width: AppSize.screenWidth!,
        height: AppSize.screenHeight! * 0.57, // Half the height of the screen
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 255, 255, 1),
          // White background color for the bottom sheet
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.defaultSize! * 2.5),
            topRight: Radius.circular(AppSize.defaultSize! * 2.5),
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          // showHalfPageBottomSheet(context);
                        },
                        borderRadius:
                            BorderRadius.circular(AppSize.defaultSize! * 1.5),
                        child: const IconWithMaterial(
                          imagePath: AssetPath.comment,
                        )),
                    SizedBox(
                      width: AppSize.defaultSize!,
                    ),
                    CustomTextField(
                      width: AppSize.screenWidth! * .74,
                      height: AppSize.defaultSize! * 2.6,
                      hintText: StringManager.caption,
                    ),
                    SizedBox(
                      width: AppSize.defaultSize!,
                    ),
                     Icon(
                      size:AppSize.defaultSize! * 2,
                      Icons.send,
                    ),
                  ],
                )),

            SizedBox(
              height: AppSize.screenHeight! * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                   return const CommentRow(
                    text: StringManager.comment,
                    font: 'Gully',
                    color: Color.fromRGBO(112, 112, 112, 1),
                  );
                },
              ),
            ),
            // Add more widgets as needed
          ],
        ),
      );
    },
  );
}
