import 'package:flutter/material.dart';

class AppTextStyles {
  // Futura styles
  static TextStyle futuraBold(double size, [double? height]) => TextStyle(
    fontFamily: 'Futura',
    fontWeight: FontWeight.bold,
    fontSize: size,
    height: height,
  );

  // Horatio D styles
  static TextStyle horatioBold(double size, [double? height]) => TextStyle(
    fontFamily: 'Horatio D',
    fontWeight: FontWeight.bold,
    fontSize: size,
    height: height,
  );

  // Specific text styles from Figma
  static TextStyle get displayLarge => horatioBold(200, 1.133);
  static TextStyle get displayMedium => horatioBold(100, 1.133);
  static TextStyle get displaySmall => horatioBold(80, 1.133);

  static TextStyle get headline1 => futuraBold(100, 1.328);
  static TextStyle get headline2 => futuraBold(80, 1.328);
  static TextStyle get headline3 => futuraBold(70, 1.328);
  static TextStyle get headline4 => futuraBold(65, 1.328);
  static TextStyle get headline5 => futuraBold(55, 1.328);
  static TextStyle get headline6 => futuraBold(45, 1.328);

  static TextStyle get subtitle1 => futuraBold(32, 1.2);
  static TextStyle get subtitle2 => futuraBold(26, 1.328);

  static TextStyle get body1 => futuraBold(22, 1.328);
  static TextStyle get body2 => futuraBold(16, 1.328);

  static TextStyle get button => futuraBold(16, 1.328);
  static TextStyle get caption => futuraBold(12, 1.328);
}
