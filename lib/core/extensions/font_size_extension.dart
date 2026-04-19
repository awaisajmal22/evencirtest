
import 'package:flutter/material.dart';

// extension FontSizeExtension on BuildContext {
//   double font(double baseSize) {
//     final size = sizeOf.size;
//     final scaleFactor = sizeOf.textScaleFactor;

//     // Reference device size (e.g. Pixel 6 = 411 × 891 logical pixels)
//     const double referenceWidth = 411.0;
//     const double referenceHeight = 891.0;

//     // Use both width & height influence for smoother scaling
//     final double widthRatio = size.width / referenceWidth;
//     final double heightRatio = size.height / referenceHeight;

//     // Combine ratios (weighted average: width has more effect)
//     final double responsiveRatio = (widthRatio * 0.7) + (heightRatio * 0.3);

//     // Scale font based on screen + system font scale (but keep it stable)
//     double scaledFont = baseSize * responsiveRatio;

//     // If user increases system font scale, let it affect slightly (but not fully)
//     scaledFont = scaledFont / scaleFactor.clamp(0.8, 1);

//     // Prevent extreme cases (tiny or huge screens)
//     return scaledFont.clamp(baseSize * 0.85, baseSize * 1);
//   }
// }
extension FontSizeExtension on BuildContext {
  double font(double baseSize) {
    final view = View.of(this);

    // ✅ Convert View → MediaQueryData
    final media = MediaQueryData.fromView(view);

    final size = media.size;
    final textScale = media.textScaleFactor;
    final orientation = media.orientation;

    // ✅ Use shortestSide for stable scaling
    final shortestSide = size.shortestSide;

    // ✅ Device detection
    final isTablet = shortestSide >= 600;
    final isDesktop = size.width >= 1000;

    // ✅ Reference sizes
    const double phoneRef = 375.0;
    const double tabletRef = 700.0;
    const double desktopRef = 1200.0;

    double ratio;

    if (isDesktop) {
      ratio = size.width / desktopRef;
      ratio = ratio.clamp(0.8, 1.2);
    } else if (isTablet) {
      ratio = shortestSide / tabletRef;
      ratio = ratio.clamp(0.9, 1.3);
    } else {
      ratio = shortestSide / phoneRef;
      ratio = ratio.clamp(0.85, 1.2);
    }

    // ✅ Landscape adjustment
    if (orientation == Orientation.landscape) {
      ratio *= 0.9;
    }

    double scaled = baseSize * ratio;

    // ✅ Controlled accessibility scaling
    scaled *= (0.9 + (textScale - 1) * 0.2);

    // ✅ Final safe clamp
    return scaled.clamp(baseSize * 0.85, baseSize * 1.4);
  }
}
