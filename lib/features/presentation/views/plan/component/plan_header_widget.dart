
import 'package:flutter/material.dart';
import 'package:testtask/core/extensions/padding_extension.dart';
import 'package:testtask/features/presentation/widgets/app_text.dart';

class PlanHeaderWidget extends StatelessWidget {
  const PlanHeaderWidget();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.hPadding(0.044)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: 'Training Calendar',
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          AppText(title: 'Save', fontSize: 18, fontWeight: FontWeight.w700),
        ],
      ),
    );
  }
}