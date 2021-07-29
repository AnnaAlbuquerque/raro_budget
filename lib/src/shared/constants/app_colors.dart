import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color cyan = Color(0xFF44C2FD);
  static const Color lightBlue = Color(0xFF2196F3);
  static const Color purple = Color(0xFF343090);
  static const Color lilac = Color(0xFFA29EFF);
  static const Color green = Color(0xFF58B368);
  static const Color pink = Color(0xFFF5487F);
  static const Color yellow = Color(0xFFFAC736);
  static const Color darkYellow = Color(0xFFFFB400);
  static const Color red = Color(0xFFF44336);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgorundWhite = Color(0xFFE5E5E5);

  static const LinearGradient cyanToPurple = LinearGradient(
    colors: [cyan, purple],
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    transform: GradientRotation(345 * pi / 180),
  );

  static const LinearGradient cyanToPurpleAppBar = LinearGradient(
    colors: [cyan, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.55],
    transform: GradientRotation(50 * pi / 180),
  );

  static const LinearGradient cyanToPurpleAddButton = LinearGradient(
    colors: [cyan, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.60],
    transform: GradientRotation(340 * pi / 180),
  );
}
