import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/font_size_extension.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/features/presentation/widgets/linear_progress.dart';
import 'package:testtask/gen/assets.gen.dart';
import 'package:testtask/gen/fonts.gen.dart';

class MyInsightWidget extends StatelessWidget {
  const MyInsightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'My Insights',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        context.heightBox(0.024),
        Row(
          children: [
            _CaloriesWeightWidget(
              title: '550',
              subtitle: ' Calories',
              description: ' 1950 Remaining',
            ),
            context.widthBox(0.024),
            _CaloriesWeightWidget(
              title: '75',
              subtitle: ' kg',
              description: ' +1.6kg',
              isCalories: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _CaloriesWeightWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final bool isCalories;
  const _CaloriesWeightWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    this.isCalories = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.hPadding(0.02756),
          vertical: context.vPadding(0.01378),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: ColorPalette.containerBg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                          fontFamily: FontFamily.mulish,
                      fontSize: context.font(40),
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.white,
                    ),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                          fontFamily: FontFamily.mulish,
                      fontSize: context.font(18),
                      fontWeight: FontWeight.w700,
                      color: ColorPalette.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isCalories)
                  SvgPicture.asset(Assets.icons.weight, fit: BoxFit.scaleDown),
                AppText(
                  title: description,
                  fontSize: 14,
                  color: ColorPalette.lightGray,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            context.heightBox(0.039),
            SizedBox(
              height: context.physicalHeight * 0.045,
              child: isCalories
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              title: '0',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.lightGray,
                            ),
                            AppText(
                              title: '2500',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorPalette.lightGray,
                            ),
                          ],
                        ),
                        context.heightBox(0.01),
                        GradientLinearProgress(progress: 0.3),
                      ],
                    )
                  : AppText(
                      textAlign: TextAlign.left,
                      title: 'Weight',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
