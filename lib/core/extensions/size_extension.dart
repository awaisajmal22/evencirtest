import 'dart:ui';

import 'package:flutter/material.dart';
extension ScreenExtension on BuildContext {

  FlutterView get view => View.of(this);


  MediaQueryData get mq => MediaQueryData.fromView(view);

 


  double get physicalWidth => mq.size.width;
  double get physicalHeight => mq.size.height;

  double get statusBarHeight => mq.padding.top;
  double get navBarHeight => mq.padding.bottom;

  
  bool get isNavigationBar => mq.viewPadding.bottom > 0;

  double get gestureBarHeight => mq.viewPadding.bottom;

  bool get isLandscape => mq.orientation == Orientation.landscape;
  bool get isPortrait => mq.orientation == Orientation.portrait;


  double get shortestSide => mq.size.shortestSide;


  bool get isMobile => shortestSide < 600;

 
  bool get isTablet => shortestSide >= 600 && shortestSide < 900;


  bool get isDesktop => shortestSide >= 900;
}