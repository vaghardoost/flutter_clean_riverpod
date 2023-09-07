import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff2C3E50),
    ),
    backgroundColor: Color(0xff2C3E50),
    elevation: 0,
  ),
  scaffoldBackgroundColor: const Color(0xff2C3E50),
);
