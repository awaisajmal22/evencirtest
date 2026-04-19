import 'package:flutter/material.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/extensions/height_width_box.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/core/extensions/size_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';
import 'package:testtask/gen/fonts.gen.dart';

class HydrationWidget extends StatelessWidget {
  const HydrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.hPadding(0.02756),
            vertical: context.vPadding(0.01378),
          ),
          decoration: BoxDecoration(
            color: ColorPalette.containerBg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: '0%',
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.azureBlue,
                    ),
                    context.heightBox(0.043),
                    AppText(
                      title: 'Hydration',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: 'Log Now',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.lightGray,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: context.physicalHeight * 0.15,
                  child: CustomPaint(painter: _HydrationBarPainter()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HydrationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final leftPad = size.width * 0.09;
    final axisY = size.height * 0.96;
    final axisX0 = leftPad;
    final axisX1 = size.width * 0.98;
    final axisPaint = Paint()..strokeWidth = size.height * 0.012;

    canvas.drawLine(Offset(axisX0, axisY), Offset(axisX1, axisY), axisPaint);

    canvas.drawLine(
      Offset(axisX0, size.height * 0.06),
      Offset(axisX0, axisY),
      axisPaint,
    );

    final barCount = 10;
    final barSpacing = (axisY - size.height * 0.09) / (barCount - 1);

    for (int i = 0; i < barCount; i++) {
      final barLength = i == 0 || i == 5 || i == 9
          ? size.width * 0.04
          : size.width * 0.02;
      final barPaint = Paint()
        ..color = i == 0 || i == 5 || i == 9
            ? ColorPalette.azureBlue
            : ColorPalette.darkGray
        ..strokeCap = StrokeCap.round
        ..strokeWidth = size.height * 0.027;
      final y = axisY - i * barSpacing;
      canvas.drawLine(
        Offset(axisX0, y),
        Offset(axisX0 + barLength, y),
        barPaint,
      );
    }

    final twoLPainter = TextPainter(
      text: TextSpan(
        text: '2 L',
        style: TextStyle(
          fontFamily: FontFamily.mulish,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    twoLPainter.layout();
    twoLPainter.paint(
      canvas,
      Offset(
        axisX0 - twoLPainter.width - size.width * 0.03,
        size.height * 0.01,
      ),
    );

    final zeroLPainter = TextPainter(
      text: TextSpan(
        text: '0 L',
        style: TextStyle(
              fontFamily: FontFamily.mulish,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    zeroLPainter.layout();
    zeroLPainter.paint(
      canvas,
      Offset(
        axisX0 - zeroLPainter.width - size.width * 0.03,
        axisY - zeroLPainter.height * 0.5,
      ),
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: '0ml',
        style: TextStyle(
              fontFamily: FontFamily.mulish,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(axisX1 - textPainter.width, axisY - textPainter.height * 0.5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
