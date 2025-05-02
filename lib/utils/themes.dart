import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        // colorSchemeSeed: Colors.blueGrey,
        // unselectedWidgetColor: Colors.blueGrey,
        fontFamily: GoogleFonts.workSans().fontFamily,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            fixedSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.workSans().fontFamily,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(6),
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        // scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(
          titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily),
          titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily),
          titleLarge: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily),
          headlineSmall: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.workSans().fontFamily),
          bodySmall: TextStyle(fontFamily: GoogleFonts.workSans().fontFamily),
        ),
      );
}
