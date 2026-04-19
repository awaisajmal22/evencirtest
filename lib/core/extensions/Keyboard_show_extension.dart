import 'package:flutter/material.dart';

extension KeyboardShowExtension on BuildContext{
  bool get keyboardClose => MediaQuery.of(this).viewInsets.bottom >0;
}