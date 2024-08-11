import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/resource_manager/string_manager.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown(
      {super.key, this.countryOrCity, this.onChanged, this.hint});

  final List<String>? countryOrCity;
  final String? hint;
  final Function(String?)? onChanged;

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: AppSize.screenWidth! * .9,
      height: AppSize.defaultSize! * 6.5,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor.withOpacity(.4)),
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2)),
      child: Center(
        child: DropdownButton2<String>(
          value: value,
          buttonStyleData: ButtonStyleData(
            width: AppSize.screenWidth! * .9,
          ),
          iconStyleData: IconStyleData(
              // iconSize: AppSize.defaultSize! * 2,
              icon: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize!),
            child: Transform.rotate(
                angle: 270 * 3.14 / 180,
                child: Image.asset(
                  AssetPath.leadingIcon,
                  height: AppSize.defaultSize! * 2,
                  color: AppColors.greyColor,
                  width: AppSize.defaultSize! * 2,
                )),
          )),
          dropdownStyleData: DropdownStyleData(
              width: AppSize.screenWidth! * .9,

              // padding: EdgeInsets.symmetric(horizontal: 10),
              maxHeight: AppSize.screenHeight! * .5),
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              widget.onChanged!(newValue);
              value = newValue;
            });
          },
          hint: Padding(
            padding: EdgeInsets.only(left: AppSize.defaultSize!),
            child: Text(
              widget.hint ?? StringManager.selectYourCountry.tr(),
              style: TextStyle(
                fontSize: AppSize.defaultSize! * 1.3,
              ),
            ),
          ),
          items: widget.countryOrCity?.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: EdgeInsets.only(left: AppSize.defaultSize!),
                child: CustomText(
                  text: value,
                  fontSize: AppSize.defaultSize! * 1.3,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
