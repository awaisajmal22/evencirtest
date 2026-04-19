import 'package:flutter/material.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

typedef OnDateSelected = void Function(DateTime date, int week);

class WeekCalendarWidget extends StatefulWidget {
  final DateTime? initialSelectedDate;
  const WeekCalendarWidget({Key? key, this.initialSelectedDate})
    : super(key: key);

  @override
  State<WeekCalendarWidget> createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialSelectedDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(covariant WeekCalendarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSelectedDate != null &&
        widget.initialSelectedDate != oldWidget.initialSelectedDate) {
      setState(() {
        _focusedDay = widget.initialSelectedDate!;
      });
    }
  }

  List<DateTime> _currentWeek(DateTime day) {
    int weekday = day.weekday;
    DateTime monday = day.subtract(Duration(days: weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final week = _currentWeek(_focusedDay);
    final int m = _focusedDay.month;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_weekDays(), _calendarRow(week, m)],
    );
  }

  Widget _weekDays() {
    const days = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: AppText(
                  title: d,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _calendarRow(List<DateTime> week, int m) {
    final selectedDay = widget.initialSelectedDate ?? DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: week.map((date) {
        final isCurrentMonth = date.month == m;
        final isSelected =
            isCurrentMonth &&
            selectedDay.year == date.year &&
            selectedDay.month == date.month &&
            selectedDay.day == date.day;
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              context.heightBox(0.02),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? ColorPalette.green : Colors.transparent,
                  ),
                  color: isSelected
                      ? ColorPalette.green.withValues(alpha: 0.19)
                      : const Color(0xFF18181C),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppText(
                    title: '${date.day}',
                    fontSize: 14,
                    color: isSelected ? Colors.white : const Color(0xFFE6E6EA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: isSelected
                    ? Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: ColorPalette.green,
                          shape: BoxShape.circle,
                        ),
                      )
                    : SizedBox(height: 8),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
