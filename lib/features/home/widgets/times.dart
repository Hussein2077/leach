import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/cutom_text.dart';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  List<String> times = [
  '10:00 AM',
  '11:00 AM',
  '12:00 PM',
  '01:00 PM',
  '02:00 PM',
  '03:00 PM',
  '04:00 PM',
  '05:00 PM',
  '06:00 PM',
  '07:00 PM',
  '08:00 PM',
  '09:00 PM',
];
   Set<int> selected = {};
  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
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
                selected.contains(index) ? selected.remove(index) :
                selected.add(index);
              });
            },
            child: Padding(
              padding:   EdgeInsets.symmetric(horizontal: AppSize.defaultSize! *.5),
              child: Container(
                  decoration: BoxDecoration(
                    color: selected.contains(index)  ? AppColors.primaryColor : Colors.white,
                    borderRadius:
                    BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  width: AppSize.defaultSize! * 8,
                  height: AppSize.defaultSize! * 2.8,
                  child: Center(
                      child: CustomText(
                        text: times[index],
                        fontSize: AppSize.defaultSize! * 1.5,
                        color: Colors.black,
                      ))),
            ),
          );
        });
  }
}
