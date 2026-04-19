import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/gen/assets.gen.dart';

class PlanTile extends StatelessWidget {
  final Map<String, dynamic> plan;
  const PlanTile({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.physicalWidth,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: ColorPalette.containerBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7),
          bottomLeft: Radius.circular(7),
        ),
        border: Border(left: BorderSide(color: ColorPalette.white, width: 7)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SvgPicture.asset(Assets.icons.menu, fit: BoxFit.scaleDown),
          context.widthBox(0.034),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: plan['tagColor'].withValues(alpha: 0.17),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(plan['tagIcon'], fit: BoxFit.scaleDown),
                      context.widthBox(0.01),
                      AppText(
                        title: plan['tag'],
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: plan['tagColor'],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: plan['title'],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),

                    AppText(
                      title: plan['duration'],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.mediumGray,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
