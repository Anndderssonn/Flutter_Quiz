import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle({
  Color color = Colors.white,
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return GoogleFonts.nunitoSans(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
