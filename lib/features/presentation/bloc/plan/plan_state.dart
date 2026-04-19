
class PlanState  {
  final List<List<Map<String, dynamic>>> weekPlans;

  const PlanState({required this.weekPlans});

  PlanState copyWith({List<List<Map<String, dynamic>>>? weekPlans}) {
    return PlanState(
      weekPlans: weekPlans ?? this.weekPlans,
    );
  }

  @override
  List<Object?> get props => [weekPlans];
}
