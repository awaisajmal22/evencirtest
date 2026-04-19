abstract class NavbarEvent {}
class NavBarChangeViewEvent implements NavbarEvent{
  final int index;
  NavBarChangeViewEvent(this.index);
}