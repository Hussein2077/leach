import 'package:flutter/material.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/resource_manager/colors.dart';

class CircularCheckbox extends StatelessWidget {
  final ValueChanged<bool?>? onChanged;
  final bool initialValue;
  final String text;
  final Color selectedColor;

  CircularCheckbox({
    required this.onChanged,
    required this.initialValue,
    required this.text,
    this.selectedColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!initialValue);
        }
      },
      child: Row(
        children: [
          Material(
            elevation: AppSize.defaultSize! * 0.5,
            shape: CircleBorder(),
            child: Container(
              width: AppSize.defaultSize! * 2,
              height: AppSize.defaultSize! * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: initialValue ? selectedColor : Colors.white,
              ),
              child: initialValue
                  ? Icon(Icons.check, color: Colors.white, size: AppSize.defaultSize! * 1.5)
                  : null,
            ),
          ),
          SizedBox(width: AppSize.defaultSize!),
          Text(
            text,
            style: TextStyle(
              fontSize: AppSize.defaultSize! * 1.5,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
