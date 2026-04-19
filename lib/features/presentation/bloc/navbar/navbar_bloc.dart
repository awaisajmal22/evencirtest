import 'package:bloc/bloc.dart';
import 'package:testtask/core/dependency_injecction/services_locator.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_event.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_state.dart';
final navbarBloc = getIt<NavbarBloc>();
class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavBarInitialState(0)) {
    on<NavBarChangeViewEvent>((event, emit) {
      emit(NavBarChangeViewState(event.index));
    });
  }
}