import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_incentive/theme/custom_colors.dart';
import 'package:psm_incentive/utils/constants.dart';

ThemeData buildTheme() {
  var baseTheme = ThemeData.light();

  return baseTheme.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 22,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.isEmpty ? Colors.white : Colors.red,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(smallRadius),
        ),
      ),
      side: BorderSide(color: Colors.grey.shade400),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primaryContainer: Colors.white,
      secondaryContainer: const Color(0xffF5F8FB),
      tertiaryFixed: const Color(0xFFF5F8FB),
      tertiaryFixedDim: Colors.grey.shade300,
      surfaceTint: Colors.black.withOpacity(0.5),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFFE9ECEF)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => const Color(0xFF0D0F10),
        ),
        foregroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        fixedSize: const Size.fromHeight(56),
      ),
    ),
    extensions: [CustomColors.light],
    iconTheme: const IconThemeData(color: Colors.black),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(mediumSmallPadding),
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFE9ECEF),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFE9ECEF),
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      hintStyle: GoogleFonts.poppins(
        fontSize: 14,
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: Color(0xFFE9ECEF), width: 1),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: mediumPadding,
            horizontal: mediumSmallPadding,
          ),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.black,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black,
      dividerColor: Colors.grey,
      unselectedLabelColor: Colors.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        visualDensity: VisualDensity.compact,
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.black),
      ),
    ),
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}

ThemeData buildDarkTheme() {
  var baseTheme = ThemeData.dark();

  return baseTheme.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF0D0F10),
      surfaceTintColor: const Color(0xFF0D0F10),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF0D0F10),
      selectedItemColor: Colors.white60,
      unselectedItemColor: Colors.grey,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (states) => states.isEmpty ? Colors.white : Colors.black,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(smallRadius),
        ),
      ),
      side: BorderSide(color: Colors.grey.shade400),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0D0F10),
      primaryContainer: const Color(0xFF0D0F10),
      secondaryContainer: const Color(0xFF1A1D20),
      tertiaryFixed: const Color.fromARGB(255, 34, 35, 35),
      tertiaryFixedDim: Colors.grey.shade800,
      surfaceTint: Colors.white.withOpacity(0.2),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFF495057)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WidgetStateColor.resolveWith((states) => Colors.white),
        foregroundColor: WidgetStateColor.resolveWith((states) => Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        disabledBackgroundColor: Colors.black,
        fixedSize: const Size.fromHeight(56),
      ),
    ),
    extensions: [CustomColors.dark],
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        iconColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(mediumSmallPadding),
      filled: true,
      fillColor: const Color(0xFF1A1D20),
      prefixIconColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF495057),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF495057),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF495057),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF495057),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      hintStyle: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white60,
      ),
      errorStyle: GoogleFonts.poppins(
        color: Colors.red.shade400,
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: Color(0xFF495057), width: 1),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: mediumPadding,
            horizontal: mediumSmallPadding,
          ),
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF0D0F10),
    tabBarTheme: TabBarTheme(
      labelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.white,
      dividerColor: Colors.grey,
      unselectedLabelColor: Colors.grey.shade700,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        visualDensity: VisualDensity.compact,
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(
            textStyle: const TextStyle(fontSize: 16),
            color: Colors.white,
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
    ),
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
  );
}
