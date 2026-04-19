import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/gen/assets.gen.dart';

class WorkOutWidget extends StatelessWidget {
  const WorkOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              title: 'Workouts',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            SvgPicture.asset(getDayNightIcon()),
            context.widthBox(0.02),
            AppText(title: '9°', fontSize: 24, fontWeight: FontWeight.w500),
          ],
        ),
        context.heightBox(0.024),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: context.vPadding(0.016),
            horizontal: context.hPadding(0.044),
          ),
          decoration: BoxDecoration(
            color: ColorPalette.containerBg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7),
              bottomLeft: Radius.circular(7),
            ),
            border: Border(
              left: BorderSide(width: 7, color: ColorPalette.tealBlue),
            ),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'December 22 - 25m - 30m',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 8),
                  AppText(
                    title: 'Upper Body',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(Assets.icons.next, fit: BoxFit.scaleDown),
            ],
          ),
        ),
      ],
    );
  }

  String getDayNightIcon() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 18) {
      return Assets.icons.light;
    } else {
      return Assets.icons.dark;
    }
  }
}
