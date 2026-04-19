
import 'package:flutter/material.dart';
import 'package:testtask/core/extensions/font_size_extension.dart';
import 'package:testtask/gen/fonts.gen.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final int maxLine;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final String? family;
  final List<Shadow>? shadow;
  final TextDecoration? decoration;
  const AppText({
    super.key,
    required this.title,
    this.shadow,
    this.fontSize = 16,
    this.decoration,
    this.color = Colors.white,
    this.textAlign = TextAlign.center,
    this.family,
    this.maxLine = 1,
    this.letterSpacing,

    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeightBehavior: TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      title,
      textAlign: textAlign,
      maxLines: maxLine,

      // textScaler: TextScaler.linear(1),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        shadows: shadow,
        decoration: decoration,
        letterSpacing: letterSpacing,
        fontFamily: family ??  FontFamily.mulish,
        fontSize: context.font(fontSize),
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
