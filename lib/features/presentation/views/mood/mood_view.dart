import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/bloc/mood/mood_bloc.dart';
import 'package:testtask/features/presentation/views/mood/griadient_thumb_slider.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/gen/assets.gen.dart';
import 'package:testtask/gen/fonts.gen.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.physicalWidth,
      height: context.physicalHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -10,
            right: 10,
            left: 10,
            child: Assets.images.moodShadow.image(fit: BoxFit.fill),
          ),

          SizedBox(
            width: context.physicalWidth,
            height: context.physicalHeight,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: context.hPadding(0.044),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.heightBox(0.036),
                  AppText(
                    title: 'Mood',
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.hPadding(0.032),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        context.heightBox(0.032),
                        AppText(
                          title: 'Start your day',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        context.heightBox(0.016),
                        AppText(
                          textAlign: TextAlign.start,
                          maxLine: 2,
                          title: 'How are you feeling at the Moment?',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  context.heightBox(0.038),
                  Center(child: GriadientThumbSlider()),
                  context.heightBox(0.024),
                  BlocBuilder<MoodBloc, MoodState>(
                    bloc: moodBloc,
                    builder: (context, state) {
                      return Center(
                        child: AppText(
                          title: state.name,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.white,
                      maximumSize: Size(context.physicalWidth, 49),
                      minimumSize: Size(context.physicalWidth, 49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: AppText(
                      title: 'Continue',
                      color: ColorPalette.primary,
                      fontSize: 16,
                      family: FontFamily.manrope,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  context.heightBox(0.019),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
