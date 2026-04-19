import 'package:bloc/bloc.dart';
import 'package:testtask/core/dependency_injecction/services_locator.dart';

part 'mood_event.dart';
part 'mood_state.dart';

final moodBloc = getIt<MoodBloc>();

class MoodBloc extends Bloc<MoodEvent, MoodState> {
  MoodBloc() : super(const MoodState(20, 'Calm')) {
    on<ChangeMoodValue>((event, emit) {
      emit(MoodState(event.value, event.name));
    });
  }
}
