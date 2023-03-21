import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFE2E2FF);
  static Color mainColor = Colors.black;
  static Color accentColor = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.blueGrey.shade400
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}
