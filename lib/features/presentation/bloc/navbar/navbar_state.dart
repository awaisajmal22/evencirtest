abstract class NavbarState {
    final int index;
    NavbarState(this.index);
}
class NavBarInitialState extends NavbarState{
  NavBarInitialState(super.index);
}
class NavBarChangeViewState extends NavbarState{

  NavBarChangeViewState(super.index);
}