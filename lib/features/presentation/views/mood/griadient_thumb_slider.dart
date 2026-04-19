import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/constant/constant.dart';
import 'package:testtask/gen/assets.gen.dart';
import 'package:testtask/features/presentation/bloc/mood/mood_bloc.dart';

class CircularIconSlider extends StatelessWidget {
  const CircularIconSlider({super.key});

  String _getIcon(double value) {
    int index = 0;
    if (value >= 75) {
      index = 3;
    } else if (value >= 45) {
      index = 2;
    } else if (value >= 25) {
      index = 1;
    } else {
      index = 0;
    }
    return Constant.instance().icons[index];
  }

  String _getName(double value) {
    int index = 0;
    if (value >= 75) {
      index = 3;
    } else if (value >= 45) {
      index = 2;
    } else if (value >= 25) {
      index = 1;
    } else {
      index = 0;
    }
    return Constant.instance().names[index];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodBloc, MoodState>(
      bloc: moodBloc,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 290,
              height: 290,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.maskGroup.provider(),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.circle,
              ),
            ),
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: state.value,
              onChange: (double value) {
                moodBloc.add(ChangeMoodValue(value, _getName(value)));
              },
              appearance: CircularSliderAppearance(
                size: 290,
                startAngle: 270,
                angleRange: 360,
                customWidths: CustomSliderWidths(
                  handlerSize: 20,
                  trackWidth: 30,
                  progressBarWidth: 30,
                  shadowWidth: 0,
                ),
                customColors: CustomSliderColors(
                  trackColor: Colors.transparent,
                  progressBarColors: [Colors.transparent, Colors.transparent],
                  dotColor: Colors.white,
                  shadowColor: Colors.white.withOpacity(0.3),
                ),
                infoProperties: InfoProperties(
                  mainLabelStyle: const TextStyle(
                    fontSize: 0,
                  ), // Hide default text
                ),
                spinnerMode: false,
              ),
              innerWidget: (double value) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(50),
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      color: ColorPalette.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        _getIcon(state.value),
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
