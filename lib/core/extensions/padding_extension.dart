
import 'package:flutter/material.dart';
import 'package:testtask/core/extensions/size_extension.dart';

extension PaddingExtension on BuildContext {
  double hPadding(double h) {
    return physicalWidth * h;
  }

  double vPadding(double v) {
    return physicalHeight * v;
  }
}
