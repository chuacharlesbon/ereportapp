import 'package:flutter/material.dart';

class Spacers {
  Widget horizontalSpace (double widthSize) => SizedBox(width: widthSize);
  Widget verticalSpace (double heightSize) => SizedBox(height: heightSize);
}

class MySizes {
  static double sizeXs = 4;
  static double sizeSm = 8;
  static double sizeReg = 16;
  static double sizeMed = 32;
  static double sizeLrg = 64;
  static double sizeXL = 128;
}