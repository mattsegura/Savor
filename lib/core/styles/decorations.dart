import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';

/// [Decorations] contains frequently used local styles.
class Decorations {
  static InputDecoration inputDecoration = InputDecoration(
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.sm)),
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.sm)),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static ButtonStyle priActionTextBTNStyle = secActionBTNStyle.copyWith(
      foregroundColor: MaterialStateProperty.all(Colors.white));

  static ButtonStyle secActionBTNStyle = ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusSizes.sm))),
      textStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(fontWeight: FontWeight.w600, letterSpacing: 1)));

  static ButtonStyle roundBTNStyle = ButtonStyle(
    shape: MaterialStateProperty.all(const CircleBorder()),
    padding: MaterialStateProperty.all(const EdgeInsets.all(PaddingSizes.md)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
  );

  static ButtonStyle chipButtonStyle(BuildContext context, String? isSelected) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isSelected == null ? Colors.transparent : context.primaryColor,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              width: 2,
              color: isSelected == null
                  ? const Color.fromARGB(1, 224, 225, 235)
                  : Colors.white),
        ),
      ),
    );
  }
}
