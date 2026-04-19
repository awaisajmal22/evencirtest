import 'package:flutter/material.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_bloc.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_event.dart';
import 'package:testtask/features/presentation/views/plan/component/plan_tile.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

class DaySectionWidget extends StatelessWidget {
  final DateTime date;
  final List<Map<String, dynamic>> dayPlans;
  final int dayIndex;
  const DaySectionWidget({
    required this.date,
    required this.dayPlans,
    required this.dayIndex,
  });

  String getWeekdayLabel(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final hasPlan = dayPlans.isNotEmpty;
    final dayColor = hasPlan ? ColorPalette.white : ColorPalette.darkBlue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.hPadding(0.044)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  AppText(
                    title: getWeekdayLabel(date.weekday),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: dayColor,
                  ),
                  SizedBox(height: 2),
                  AppText(
                    title: date.day.toString(),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: dayColor,
                  ),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: DragTarget<Map<String, dynamic>>(
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    final fromDayIndex = data['fromDayIndex'] as int;
                    final planIndex = data['planIndex'] as int;
                    planBloc.add(
                      MovePlan(
                        fromDayIndex: fromDayIndex,
                        toDayIndex: dayIndex,
                        planIndex: planIndex,
                      ),
                    );
                  },
                  builder: (context, candidateData, rejectedData) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(dayPlans.length, (planIdx) {
                        final plan = dayPlans[planIdx];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: LongPressDraggable<Map<String, dynamic>>(
                            data: {
                              'plan': plan,
                              'fromDayIndex': dayIndex,
                              'planIndex': planIdx,
                            },
                            feedback: Material(
                              color: Colors.transparent,
                              child: PlanTile(plan: plan),
                            ),
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: PlanTile(plan: plan),
                            ),
                            child: PlanTile(plan: plan),
                          ),
                        );
                      }),

                      if (dayPlans.isEmpty)
                        Container(
                          height: 40,
                          color: candidateData.isNotEmpty
                              ? ColorPalette.indigo.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: ColorPalette.darkGray),
      ],
    );
  }
}
