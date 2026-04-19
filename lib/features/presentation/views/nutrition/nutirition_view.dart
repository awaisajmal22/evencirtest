import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/views/nutrition/component/calendar_widget.dart';
import 'package:testtask/features/presentation/views/nutrition/component/hydration_widget.dart';
import 'package:testtask/features/presentation/views/nutrition/component/my_insight_widget.dart';
import 'package:testtask/features/presentation/views/nutrition/component/week_calendar_widget.dart';
import 'package:testtask/features/presentation/views/nutrition/component/work_out_widget.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/gen/assets.gen.dart';

class NutiritionView extends StatefulWidget {
  const NutiritionView({super.key});

  @override
  State<NutiritionView> createState() => _NutiritionViewState();
}

class _NutiritionViewState extends State<NutiritionView> {
  int _selectedWeek = 1;
  int _totalWeeks = 4;
  DateTime _selectedDate = DateTime.now();

  void _showCalendarSheet() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: CalendarWidget(
            initialSelectedDate: _selectedDate,
            onDateSelected: (date, week, totalWeeks) {
              Navigator.of(
                context,
              ).pop({'date': date, 'week': week, 'totalWeeks': totalWeeks});
            },
          ),
        );
      },
    );
    if (result != null) {
      setState(() {
        _selectedDate = result['date'] as DateTime;
        _selectedWeek = result['week'] as int;
        _totalWeeks = result['totalWeeks'] as int;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.hPadding(0.044)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            context.heightBox(0.016),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.icons.alert, fit: BoxFit.scaleDown),
                Spacer(),
                GestureDetector(
                  onTap: _showCalendarSheet,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.selectWeek,
                        fit: BoxFit.scaleDown,
                      ),
                      context.widthBox(0.02),
                      AppText(
                        title: "Week $_selectedWeek/$_totalWeeks",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.arrow_drop_down, color: ColorPalette.white),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            context.heightBox(0.024),
            AppText(
              title:
                  "Today, " +
                  DateFormat('dd MMM yyyy').format(DateTime.now()).toString(),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            context.heightBox(0.016),
            WeekCalendarWidget(initialSelectedDate: _selectedDate),
            context.heightBox(0.016),
            Center(
              child: Container(
                color: ColorPalette.darkGray,
                width: 32,
                height: 5,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    context.heightBox(0.024),
                    WorkOutWidget(),
                    context.heightBox(0.032),
                    MyInsightWidget(),
                    context.heightBox(0.012),
                    HydrationWidget(),
                    Container(
                      width: context.physicalWidth,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.hPadding(0.02756),
                        vertical: context.vPadding(0.01378),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: ColorPalette.oceanBlue,
                      ),
                      child: AppText(
                        title: '500 ml added to water log',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    context.heightBox(0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
