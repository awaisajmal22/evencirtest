part of 'mood_bloc.dart';

abstract class MoodEvent  {
  
}

class ChangeMoodValue implements MoodEvent {
  final double value;
  final String name;
  const ChangeMoodValue(this.value, this.name);

 
}
