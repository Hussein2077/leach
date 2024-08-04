import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/routes.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/utils/methods.dart';
import 'package:leach/core/widgets/custom_text_field.dart';
import 'package:leach/features/chat/widgets/chat_app_bar.dart';
import 'package:leach/features/chat/widgets/chat_list_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Methods.instance.paddingCustom,
        child: Column(
          children: [
            ChatAppBar(
              text: StringManager.messages.tr(),    leadingIcon: false,
            ),
            CustomTextField(
              hintText: StringManager.searchName.tr(),
              height: AppSize.defaultSize! * 3.5,

              prefixIcon: Image.asset(AssetPath.search),
            ),
            SizedBox(
              height: AppSize.defaultSize!,
            ),
            Expanded(child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
              return GestureDetector(

                  onTap:  () {
Navigator.pushNamed(context, Routes.chatDetails);
                  },
                  child
                  : const ChatListItem());
            })),
          ],
        ),
      ),
    );
  }
}
