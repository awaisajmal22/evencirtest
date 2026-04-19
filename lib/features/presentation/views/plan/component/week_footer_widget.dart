
import 'package:flutter/material.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

class WeekFooterWidget extends StatelessWidget {
  final List<DateTime> weekDates;
  const WeekFooterWidget({required this.weekDates});

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.hPadding(0.044)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            textAlign: TextAlign.left,
            title: 'Week 2',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                textAlign: TextAlign.left,
                title:
                    '${_monthName(weekDates.first.month)} ${weekDates.first.day}-${weekDates.last.day}',
                fontSize: 16,
                color: ColorPalette.mediumGray,
                fontWeight: FontWeight.w400,
              ),
              AppText(
                textAlign: TextAlign.left,
                title: 'Total: 60min',
                fontSize: 16,
                color: ColorPalette.mediumGray,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          context.heightBox(0.012),
        ],
      ),
    );
  }
}