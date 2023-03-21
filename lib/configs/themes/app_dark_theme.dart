import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFF85187);
const Color mainTextColorDark = Colors.white;
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        primaryColor: primaryColorLight,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextTheme().apply(
            bodyColor: mainTextColorDark, displayColor: mainTextColorDark));
  }
}
