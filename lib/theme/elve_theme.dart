import 'package:flutter/material.dart';

class ElveTheme {
  static const widthBreakpoints = [360, 420, 640, 768, 1080];
  static const gridCrossAxisCount = [2, 2, 3, 4, 4];
  static const gridMaxWidth = 1080.0;
  static const primarySwatch = Colors.blueGrey;
  static const backgroundColor = Color(0xFFF2F3F8);
  static const shadowColor = Color(0xFF3A5160);
  static const darkText = Color(0xFF253840);
  static const darkerText = Color(0xFF17262A);
  static const lightText = Color(0xFF4A6572);
  static const deactivatedText = Color(0xFF767676);
  static const dismissibleBackground = Color(0xFF364A54);

  static final elveShadow = BoxShadow(
    color: ElveTheme.shadowColor.withOpacity(0.4),
    offset: const Offset(1.1, 4.0),
    blurRadius: 8.0,
  );

  static const TextTheme textTheme = TextTheme(
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  /// Drawer.
  static const headline1 = TextStyle();
  static const headline2 = TextStyle();
  static const headline3 = TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    fontSize: 36,
    color: lightText,
    height: 0.9,
  );

  /// Card Appbar.
  static const headline4 = TextStyle(
    fontWeight: FontWeight.bold,
    letterSpacing: 0.4,
    fontSize: 32,
    color: darkText,
    height: 0.9,
  );

  static const headline5 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: lightText,
  );

  static const headline6 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle2 = TextStyle(
    color: Colors.white,
    fontSize: 12,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 1.2,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.6,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    // height: 1.6,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText,
  );

  /// Create a lighter color from [color].
  static Color lighterShade(Color color) {
    final c = HSLColor.fromColor(color);
    var light = c.lightness + 0.1;
    light = (light > 1.0) ? 1.0 : light;
    return c.withLightness(light).toColor();
  }

  /// Creates a darker color from [color].
  static Color darkerShade(Color color) {
    final c = HSLColor.fromColor(color);
    var light = c.lightness - 0.1;
    light = (light < 0.05) ? 0.05 : light;
    return c.withLightness(light).toColor();
  }

  /// Get grid cross axis count.
  static int getGridCrossAxisCount(double logicalPixelWidth) {
    var index = -1;
    for (final breakpoint in widthBreakpoints) {
      if (logicalPixelWidth > breakpoint) {
        index++;
      } else {
        return gridCrossAxisCount[index];
      }
    }
    return gridCrossAxisCount[gridCrossAxisCount.length - 1];
  }
}
