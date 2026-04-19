import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/font_size_extension.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_bloc.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_event.dart';
import 'package:testtask/features/presentation/bloc/navbar/navbar_state.dart';
import 'package:testtask/features/presentation/views/mood/mood_view.dart';
import 'package:testtask/features/presentation/views/nutrition/nutirition_view.dart';
import 'package:testtask/features/presentation/views/plan/plan_view.dart';
import 'package:testtask/gen/assets.gen.dart';
import 'package:testtask/gen/fonts.gen.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return BlocBuilder<NavbarBloc, NavbarState>(
      bloc: navbarBloc,
      builder: (context, state) {
        return Scaffold(

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) {
              navbarBloc.add(NavBarChangeViewEvent(index));
            },
            unselectedItemColor: ColorPalette.gray,
            selectedItemColor: ColorPalette.white,
            unselectedLabelStyle: TextStyle(
              fontSize: context.font(14),
              fontWeight: FontWeight.w400,
              color: ColorPalette.gray,
              fontFamily: FontFamily.mulish,
            ),

            selectedLabelStyle: TextStyle(
              fontSize: context.font(14),
              fontWeight: FontWeight.w400,
              color: ColorPalette.white,
              fontFamily: FontFamily.mulish,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.nutrition,
                  color: state.index == 0
                      ? ColorPalette.white
                      : ColorPalette.gray,
                  fit: BoxFit.scaleDown,
                ),
                label: 'Nutrition',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.plan,
                  color: state.index == 1
                      ? ColorPalette.white
                      : ColorPalette.gray,
                  fit: BoxFit.scaleDown,
                ),
                label: 'Plan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.mood,
                  color: state.index == 2
                      ? ColorPalette.white
                      : ColorPalette.gray,
                  fit: BoxFit.scaleDown,
                ),
                label: 'Mood',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.profile,
                  color: state.index == 3
                      ? ColorPalette.white
                      : ColorPalette.gray,
                  fit: BoxFit.scaleDown,
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: IndexedStack(
            index: state.index,
            children: const [
              NutiritionView(),
              PlanView(),
              MoodView(),
              Center(child: Text('Profile View')),
            ],
          ),
        );
      },
    );
  }
}
