import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(
      brightness: brightness,
      appBarTheme:  const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(color: const Color.fromARGB(74, 72, 170, 222), borderRadius: BorderRadius.circular(150)),
          labelStyle: const TextStyle(
            fontFamily: 'Areal',
          ),
          labelColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Areal',
          ),
          unselectedLabelColor: const Color.fromARGB(255, 72, 170, 222),
        )
    );
    return theme.copyWith(
      iconTheme: theme.iconTheme.copyWith(size: 32),
    );
  }
}