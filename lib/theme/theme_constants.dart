import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const PRIMARY_COLOR = Colors.lightBlue;
const COLOR_ACCENT = Colors.lightBlueAccent;

ThemeData lightTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      textTheme: GoogleFonts.bebasNeueTextTheme().apply(
            bodyColor: Colors.green,
            displayColor: Colors.green,
      )
      );

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
