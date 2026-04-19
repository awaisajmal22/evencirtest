import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

typedef OnDateSelected = void Function(DateTime date, int week, int totalWeeks);

class CalendarWidget extends StatefulWidget {
  final DateTime? initialSelectedDate;
  final OnDateSelected? onDateSelected;
  const CalendarWidget({
    Key? key,
    this.initialSelectedDate,
    this.onDateSelected,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialSelectedDate ?? DateTime.now();
    _selectedDay = widget.initialSelectedDate;
  }

  List<List<DateTime>> _monthGrid(DateTime month) {
    final List<List<DateTime>> weeks = [];
    final int year = month.year;
    final int m = month.month;
    final int daysInMonth = DateUtils.getDaysInMonth(year, m);
    DateTime firstDay = DateTime(year, m, 1);
    int offset = firstDay.weekday - 1; // Monday=1
    DateTime gridStart = firstDay.subtract(Duration(days: offset));
    int totalCells = ((offset + daysInMonth) / 7).ceil() * 7;
    for (int i = 0; i < totalCells; i += 7) {
      List<DateTime> week = List.generate(
        7,
        (j) => gridStart.add(Duration(days: i + j)),
      );
      weeks.add(week);
    }
    return weeks;
  }

  @override
  Widget build(BuildContext context) {
    final weeks = _monthGrid(_focusedDay);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(),
        _weekDays(),
        ..._calendar(weeks),
        if (context.isNavigationBar)
          context.heightBox(0.08)
        else
          context.heightBox(0.04),
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(
                _focusedDay.year,
                _focusedDay.month - 1,
                1,
              );
            });
          },
        ),
        AppText(
          title: DateFormat.yMMM().format(_focusedDay),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: Colors.white),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(
                _focusedDay.year,
                _focusedDay.month + 1,
                1,
              );
            });
          },
        ),
      ],
    );
  }

  Widget _weekDays() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
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
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  List<Widget> _calendar(List<List<DateTime>> weeks) {
    final int m = _focusedDay.month;
    return weeks.asMap().entries.map((entry) {
      int w = entry.key;
      List<DateTime> week = entry.value;
      return Row(
        children: week.map((date) {
          final isCurrentMonth = date.month == m;
          final isSelected =
              isCurrentMonth &&
              _selectedDay != null &&
              _selectedDay!.year == date.year &&
              _selectedDay!.month == date.month &&
              _selectedDay!.day == date.day;
          return Expanded(
            child: isCurrentMonth
                ? GestureDetector(
                    onTap: () => _onDateSelected(date, w + 1, weeks.length),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? ColorPalette.green
                              : Colors.transparent,
                          width: 2,
                        ),
                        color: isSelected
                            ? ColorPalette.green.withValues(alpha: 0.19)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: AppText(
                          title: '${date.day}',
                          fontSize: 14,
                          color: ColorPalette.white,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                : Container(),
          );
        }).toList(),
      );
    }).toList();
  }

  void _onDateSelected(DateTime date, int weekNumber, int totalWeeks) {
    setState(() {
      _selectedDay = date;
    });
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(date, weekNumber, totalWeeks);
    }
  }
}
