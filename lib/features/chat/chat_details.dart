import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/features/chat/widgets/chat_app_bar.dart';
import 'package:leach/features/chat/widgets/chat_details_item.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: Column(
          children: [
            const ChatAppBar(
              text: 'Ahmed Ali',

            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ChatDetailsItem();
                    })),
            Row(
              children: [
                CustomTextField(
                  hintText: StringManager.message.tr(),
                  height: AppSize.defaultSize! * 3.5,
                  width: AppSize.screenWidth! * .8,
                ),
                const Spacer(),
                const Icon(Icons.send, color: AppColors.greyColor)
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
          ],
        ),
      ),
    );
  }
}
