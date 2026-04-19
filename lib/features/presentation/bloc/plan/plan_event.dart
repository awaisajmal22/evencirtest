
abstract class PlanEvent  {

}

class LoadPlans implements PlanEvent {

}

class MovePlan implements PlanEvent {
  final int fromDayIndex;
  final int toDayIndex;
  final int planIndex;

  const MovePlan({
    required this.fromDayIndex,
    required this.toDayIndex,
    required this.planIndex,
  });

  @override
  List<Object?> get props => [fromDayIndex, toDayIndex, planIndex];
}
