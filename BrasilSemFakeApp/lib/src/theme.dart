import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xffffa000);
  static const textIcons = Color(0xffFFFFFF);
  static const primaryText = Color(0xff212121);
  static const secundaryText = Color(0xff757575);
  static const divider = Color(0xffBDBDBD);
}

TextStyle get _headline4 => const TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w600,
  color: AppColors.primaryText,
);

TextStyle get _headlineDark4 => const TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w600,
  color: AppColors.textIcons,
);

TextStyle get _subtitle1 => const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryText,
);

TextStyle get _subtitleDark1 => const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: AppColors.textIcons,
);

// TextStyle get _subtitle1 => const TextStyle(
//       fontSize: 22,
//       fontFamily: 'Nunito',
//       fontWeight: FontWeight.w600,
//       fontStyle: FontStyle.italic,
//       color: AppColors.primaryText,
//     );

// TextStyle get _bodytext1 => const TextStyle(
//       fontSize: 12,
//       fontFamily: 'ZillaSlab',
//       fontWeight: FontWeight.w600,
//       fontStyle: FontStyle.italic,
//       color: AppColors.primaryText,
//     );

// TextStyle get _caption => const TextStyle(
//       fontSize: 12,
//       fontFamily: 'Nunito',
//       fontWeight: FontWeight.w600,
//       fontStyle: FontStyle.italic,
//       color: AppColors.primaryText,
//     );

// TextStyle get _overline => const TextStyle(
//       fontSize: 12,
//       fontFamily: 'ZillaSlab',
//       fontWeight: FontWeight.w600,
//       fontStyle: FontStyle.italic,
//       color: AppColors.primaryText,
//     );

class GetTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryText,
      colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.textIcons,
      onPrimaryContainer: AppColors.primaryText,
      secondary: AppColors.secundaryText,
      onTertiary: AppColors.textIcons,
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
      headline4: _headlineDark4,
      subtitle1:  _subtitleDark1,
    )
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.textIcons,
      onPrimaryContainer: AppColors.primaryText,
      secondary: AppColors.secundaryText,
      onTertiary: AppColors.textIcons,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
      headline4: _headline4,
      subtitle1:  _subtitle1,
    )
  );
}
