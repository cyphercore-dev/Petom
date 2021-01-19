import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFFD6456),
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}

// theme: ThemeData(
//   // primaryColor: Color(0xFFFD6456),
//   primarySwatch: Colors.indigo,
//   accentColor: Colors.amber,
//   canvasColor: Color.fromRGBO(255, 254, 229, 1),
//   fontFamily: 'Montserrat',
//   textTheme: ThemeData.light().textTheme.copyWith(
//       body1: TextStyle(
//         color: Color.fromRGBO(20, 51, 51, 1),
//       ),
//       body2: TextStyle(
//         color: Color.fromRGBO(20, 51, 51, 1),
//       ),
//       title: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Montserrat',
//         fontWeight: FontWeight.bold,
//       )),
// ),
