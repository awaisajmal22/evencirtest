import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_bloc.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_event.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_state.dart';
import 'package:testtask/features/presentation/views/plan/component/plan_header_widget.dart';
import 'package:testtask/features/presentation/views/plan/component/plan_tile.dart';
import 'package:testtask/features/presentation/views/plan/component/section_day_widget.dart';
import 'package:testtask/features/presentation/views/plan/component/week_footer_widget.dart';
import 'package:testtask/features/presentation/views/plan/component/week_header_widget.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  List<DateTime> getCurrentWeekDates() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.heightBox(0.016),
            const PlanHeaderWidget(),
            context.heightBox(0.04),
            Container(
              height: 3,
              width: context.physicalWidth,
              color: ColorPalette.indigo,
            ),
            context.heightBox(0.016),
            WeekHeaderWidget(weekDates: weekDates),
            BlocBuilder<PlanBloc, PlanState>(
              bloc: planBloc,
              builder: (context, state) {
                return Column(
                  children: List.generate(7, (index) {
                    return DaySectionWidget(
                      date: weekDates[index],
                      dayPlans: state.weekPlans[index],
                      dayIndex: index,
                    );
                  }),
                );
              },
            ),
            context.heightBox(0.024),
            Container(
              height: 3,
              width: context.physicalWidth,
              color: ColorPalette.green,
            ),
            context.heightBox(0.016),
            WeekFooterWidget(weekDates: weekDates),
          ],
        ),
      ),
    );
  }
}
