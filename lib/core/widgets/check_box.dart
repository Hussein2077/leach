import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class CircularCheckbox extends StatefulWidget {
  final String text;
  final bool initialValue;
  final Function(bool?)? onChanged;

  const CircularCheckbox({
    super.key,
    required this.text,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  _CircularCheckboxState createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  bool? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  void didUpdateWidget(CircularCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != _isChecked) {
      _isChecked = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked!;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(_isChecked);
        }
      },
      child: Row(
        children: [
          Material(
            elevation: 10,
            shape: const CircleBorder(),
            child: Container(
              width: AppSize.defaultSize! * 1.5,
              height: AppSize.defaultSize! * 1.9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isChecked! ? AppColors.primaryColor : Colors.transparent,
              ),
              child: _isChecked!
                  ?  Icon(
                Icons.check,
                color: Colors.white,
                size: AppSize.defaultSize! * 1.5,
              )
                  : null,
            ),
          ),
          SizedBox(width: AppSize.defaultSize!),
          SizedBox(

            child: CustomText(
              fontFamily: 'Gully-CD',
              text: widget.text,
              textAlign: TextAlign.start,
              fontSize: AppSize.defaultSize! * 1.5,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
