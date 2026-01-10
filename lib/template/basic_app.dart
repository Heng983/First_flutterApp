import 'package:flutter/material.dart';
import 'package:flutter_application_1/fontsize_logic.dart';
import 'package:flutter_application_1/template/FoodMenu/main_tabscreen_bar.dart';
import 'package:flutter_application_1/template/login_screen.dart';
import 'package:flutter_application_1/template/main_screen.dart';
import 'package:flutter_application_1/themeMode.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_application_1/template/login_screen.dart';
//import 'package:flutter_application_1/template/main_screen.dart';
//import 'homeScreen/first_screen.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({super.key});

  @override
  State<BasicApp> createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<Thememode>().themeIndex;
    return MaterialApp(
      home: LoginScreen(),
      themeMode: themeIndex == 0
          ? ThemeMode.system
          : themeIndex == 1
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
    );
  }

  ThemeData _darkTheme() {
    final maincolor = Color(0xFF84994F);
    final fontColor = Colors.white;

    double size = context.watch<FontsizeLogic>().size;

    return ThemeData(
      brightness: Brightness.dark,

      textTheme: TextTheme(bodyMedium: GoogleFonts.oswald(fontSize: size)),

      tabBarTheme: TabBarThemeData(
        labelColor: Colors.grey.shade600,
        indicatorColor: Color(0xFF628141),
        unselectedLabelColor: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: maincolor,
        foregroundColor: fontColor,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow.shade100,
        selectedItemColor: Color(0xFF715A5A),
        unselectedItemColor: Color(0xFF37353E),
      ),
    );
  }

  ThemeData _lightTheme() {
    final maincolor = Color(0xFF84994F);
    final fontColor = Colors.white;

    double size = context.watch<FontsizeLogic>().size;

    return ThemeData(
      brightness: Brightness.light,

      textTheme: TextTheme(bodyMedium: GoogleFonts.oswald(fontSize: size)),

      tabBarTheme: TabBarThemeData(
        labelColor: Colors.grey.shade600,
        indicatorColor: Color(0xFF628141),
        unselectedLabelColor: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: maincolor,
        foregroundColor: fontColor,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow.shade100,
        selectedItemColor: Color(0xFF715A5A),
        unselectedItemColor: Color(0xFF37353E),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
      ),
    );
  }
}
