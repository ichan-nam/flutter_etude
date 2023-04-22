import 'package:flutter/material.dart';

// static extension methods & properties
// Colors.customPink3 이렇게 쓸 수 없음
// CustomColors.customPink3 이렇게 써야 함
// 관련 논의: https://github.com/dart-lang/language/issues/723
extension CustomColors on Colors {
  static const customWhite = Color(0xFFF2F2F2);
  static const customPink1 = Color(0xFFF26398);
  static const customPink2 = Color(0xFFF26398);
  static const customPink3 = Color(0xFFF2055C);
  static const customRed = Color(0xFFF20530);
}
