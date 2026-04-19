import 'package:get_it/get_it.dart';
import 'package:testtask/features/presentation/bloc/mood/mood_bloc.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:testtask/features/presentation/bloc/plan/plan_bloc.dart';

final getIt = GetIt.instance;
class ServicesLocator {
ServicesLocator._();
  static final ServicesLocator _instance = ServicesLocator._();
  factory ServicesLocator.instance() => _instance;
Future<void> init()async{
       getIt.registerFactory(() => NavbarBloc());
       getIt.registerFactory(() => PlanBloc());
       getIt.registerFactory(() => MoodBloc());
}
}