
import 'package:flutter/material.dart';
import 'package:testtask/core/extensions/size_extension.dart';

extension HeightWidthBox on BuildContext {
  SizedBox heightBox(double h) {
    return SizedBox(height: physicalHeight * h);
  }

  SizedBox widthBox(double w) {
    return SizedBox(width: physicalWidth * w);
  }
}
