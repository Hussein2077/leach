import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class SizeRow extends StatefulWidget {
  const SizeRow({super.key, this.isDog = false, this.onValueChange});

  final bool isDog;
  final Function(int?)? onValueChange;
  @override
  _SizeRowState createState() => _SizeRowState();
}

class _SizeRowState extends State<SizeRow> {
  int? selectedIndex; // Variable to track the selected index

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.defaultSize! * 11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (_, index) {
          bool isSelected = selectedIndex == index; // Check if this item is selected

          return Padding(
            padding: EdgeInsets.only(right: AppSize.defaultSize!),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                   widget.onValueChange?.call(selectedIndex); // Update the selected index
                });
              },
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
                        color: isSelected ? AppColors.primaryColor : Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSize.defaultSize! * .4,
                          ),
                          child: Image.asset(
                            widget.isDog
                                ? AssetPath.listDog[index].toString()
                                : AssetPath.listCat[index].toString(),
                            color: isSelected ? Colors.white : AppColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    fontFamily: 'Gully-CD',
                    text: !widget.isDog
                        ? StringManager.sizeList[index].toString()
                        : StringManager.sizeListDog[index].toString(),
                    fontSize: AppSize.defaultSize! * 1.5,
                    color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
