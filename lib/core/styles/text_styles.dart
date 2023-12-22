import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  final TextStyle sRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle sThick = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle mRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 22,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
  final TextStyle mThick = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 22,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lThin = GoogleFonts.workSans(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 36,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lRegular = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 26,
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );

  final lThick = GoogleFonts.workSans(
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontSize: 36,
    color: const Color(0xAA1BB859),
    decoration: TextDecoration.none,
    letterSpacing: 0,
  );
}
