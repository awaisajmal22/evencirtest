import 'package:flutter/material.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/size_extension.dart';

class GradientLinearProgress extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const GradientLinearProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.physicalHeight * 0.007,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.dark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorPalette.skyBlue,
                    ColorPalette.lightGreen,
                    ColorPalette.mintGreen,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
