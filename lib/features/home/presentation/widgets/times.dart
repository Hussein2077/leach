import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class Times extends StatefulWidget {
  const Times({super.key, this.onTap});

  final Function(String)? onTap;

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  List<String> times = [
    '10:00',
    '11:00',
    '12:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
  ];
  Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3,
          mainAxisSpacing: AppSize.defaultSize! * 1,
        ),
        itemCount: times.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selected.contains(index)
                    ? selected.remove(index)
                    : selected.clear();
                selected.add(index);
                //make it only one selection
              });
              widget.onTap?.call(times[index]);
            },
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * .5),
              child: Container(
                  decoration: BoxDecoration(
                    color: selected.contains(index)
                        ? AppColors.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  width: AppSize.defaultSize! * 8,
                  height: AppSize.defaultSize! * 2.8,
                  child: Center(
                      child: CustomText(
                    text: times[index],
                    fontSize: AppSize.defaultSize! * 1.5,
                    color:
                        selected.contains(index) ? Colors.white : Colors.black,
                    fontFamily: 'Gully',
                  ))),
            ),
          );
        });
  }
}
