import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cached_network_image.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_bloc.dart';
import 'package:leach/features/profile/presentation/controller/create_pet_bloc/create_pet_events.dart';
import 'package:leach/features/profile/presentation/side%20bar/side_bar_row.dart';

class PlainCard extends StatefulWidget {
  const PlainCard({super.key, required this.uuid, required this.path, this.onDeleteTap});

  final String uuid;
  final String path;
final Function()? onDeleteTap;
  @override
  State<PlainCard> createState() => _PlainCardState();
}

class _PlainCardState extends State<PlainCard> {
  @override
  void initState() {
    items = [
      SideBarRow(
        textSize: AppSize.defaultSize! * 2,
        image: AssetPath.x,
        text: StringManager.deletePhoto.tr(),
        onTap:widget.onDeleteTap,
      ),
    ];
    super.initState();
  }

  List<SideBarRow>? items;
  SideBarRow? selectedValue;

  List<DropdownMenuItem<SideBarRow>> _addDividersAfterItems(
      List<SideBarRow> items) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 3,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2<SideBarRow>(
                customButton: Image.asset(
                  AssetPath.menuFriend,
                  color: AppColors.primaryColor,
                ),
                items: _addDividersAfterItems(items ?? []),
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
                    borderRadius:
                        BorderRadius.circular(AppSize.defaultSize! * 4),
                    color: const Color.fromRGBO(246, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 4),
          // Image border
          child: CachedNetworkCustom(
            url: widget.path,
            width: AppSize.screenWidth!,
            height: AppSize.defaultSize! * 20,
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(
          height: AppSize.defaultSize! * 2,
        ),
      ],
    );
  }
}
