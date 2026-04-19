import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/dependency_injecction/services_locator.dart';
import 'package:testtask/gen/assets.gen.dart';
import 'plan_event.dart';
import 'plan_state.dart';
final planBloc = getIt<PlanBloc>();
class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc()
      : super(PlanState(weekPlans: [
          [
            {
              'title': 'Arm Blaster',
              'tag': 'Arms Workout',
              'tagColor': ColorPalette.green,
              'tagIcon': Assets.icons.armworkout,
              'duration': '25m - 30m',
            },
          ],
          [],
          [],
          [
            {
              'title': 'Leg Day Blitz',
              'tag': 'Leg Workout',
              'tagColor': ColorPalette.indigo,
              'tagIcon': Assets.icons.legworkout, 
              'duration': '25m - 30m',
            },
          ],
          [],
          [],
          [],
        ])) {
    on<LoadPlans>((event, emit) {
      // No-op for now
    });
    on<MovePlan>((event, emit) {
      final newPlans = List<List<Map<String, dynamic>>>.from(state.weekPlans.map((e) => List<Map<String, dynamic>>.from(e)));
      final plan = newPlans[event.fromDayIndex][event.planIndex];
      newPlans[event.fromDayIndex].removeAt(event.planIndex);
      newPlans[event.toDayIndex].add(plan);
      emit(state.copyWith(weekPlans: newPlans));
    });
  }
}
