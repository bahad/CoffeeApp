import 'package:coffeeapp/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._init();
  static ThemeManager get instance {
    return _instance;
  }

  ThemeManager._init();

  ThemeData get lightTheme => configureLightThemeData();
  ThemeData get darkTheme => configureDarkThemeData();

  ThemeData configureLightThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.dark),
      useMaterial3: true,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 28.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleLarge: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleMedium: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleSmall: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelLarge: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelMedium: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelSmall: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 6,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.button,
          shape: const StadiumBorder(),
          maximumSize: const Size(double.infinity, 44),
          minimumSize: const Size(double.infinity, 44),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.filledDark,
        iconColor: AppColors.white,
        prefixIconColor: AppColors.white,
        isDense: true,
        //  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  ThemeData configureDarkThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.dark),
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleMedium: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleSmall: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelLarge: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelMedium: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        labelSmall: GoogleFonts.sora(
          textStyle: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.filledDark,
        iconColor: AppColors.filledDark,
        prefixIconColor: AppColors.filledDark,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
