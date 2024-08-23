import 'package:flutter/material.dart';
import 'package:lenche/application/theme/palette.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: Palette.myColor,
      fontFamily: 'DidactGothic-Regular',


      //APP BAR
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF007000),
          centerTitle: true
      ),

      //TEXT FIELD
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: const Color(0xFFe6f1e6),
          labelStyle: const TextStyle(
            color: Colors.black45
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),
      ),


    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //elevation: 20,
        side: const BorderSide(
          color: Colors.black12
        ),
        //shadowColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
       foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFe6f1e6),
          //side: const BorderSide(color: Color(0xFF700070)),
        )
      ),


    /*bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white
    )*/
  );




  static final darkTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
  );

}

extension ColorSchemes on ColorScheme {

}
