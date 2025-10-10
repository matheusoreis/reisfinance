import 'package:flutter/material.dart';

extension ScreenContext on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeightCenter => MediaQuery.sizeOf(this).height / 2;
  double get screenWidthCenter => MediaQuery.sizeOf(this).width / 2;
  double get buttonHeight => 50.0;
  double get buttonWidth => screenWidth;
  double get radius => 10.0;
  double get padding => 10.0;
}
