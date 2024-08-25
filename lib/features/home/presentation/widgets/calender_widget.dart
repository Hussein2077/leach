import 'package:flutter/material.dart';
import 'package:leach/core/resource_manager/asset_path.dart';
import 'package:leach/core/resource_manager/colors.dart';
import 'package:leach/core/utils/app_size.dart';
import 'package:leach/core/widgets/leading_icon.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key, required this.onDaySelected});
final Function(DateTime day, DateTime focusDay) onDaySelected;
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusDay) {

    setState(() {
      today = day;
    });
    widget.onDaySelected(today, focusDay);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
            fontSize: AppSize.defaultSize! * 1.8, fontWeight: FontWeight.w700),
        leftChevronIcon: Image.asset(
          AssetPath.leadingIcon,
          color: AppColors.primaryColor,
        ),
        rightChevronIcon: Transform.rotate(
            angle: 180 * 3.14 / 180,
            child: Image.asset(
              AssetPath.leadingIcon,
              color: AppColors.primaryColor,
            )),
        formatButtonShowsNext: const bool.fromEnvironment(''),
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        selectedDecoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, today),

      focusedDay: today,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2050, 10, 16),
      onDaySelected: _onDaySelected,
    );
  }
}
