import 'package:flutter/material.dart';

class AppColors {
  // Primary colors from Figma
  static const Color primary = Color(0xFF00BEE6); // Using blue as primary
  static const Color secondary = Color(0xFFFFBC29); // Using yellow as secondary
  static const Color teal = Color(0xFF4CF4E6);
  static const Color tealDark = Color(0xFF00A395);
  static const Color blueLight = Color(0xFFB2ECF7);
  static const Color blue = Color(0xFF00BEE6);
  static const Color blueDark = Color(0xFF0096B5);
  static const Color yellowLight = Color(0xFFFFE3A6);
  static const Color yellow = Color(0xFFFFBC29);
  static const Color yellowDark = Color(0xFFDEA11D);
  
  // Secondary colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB71C1C);
  static const Color success = Color(0xFF43A047); // Added success color
  static const Color warning = Color(0xFFFFB300); // Added warning color
  static const Color info = Color(0xFF1E88E5); // Added info color
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textOnLight = Colors.black;
  static const Color textOnDark = Colors.white;
  
  // Team colors (keep existing)
  static const List<Color> teamColors = [
    Color(0xFFE53935), // Rouge
    Color(0xFF1E88E5), // Bleu
    Color(0xFF43A047), // Vert
    Color(0xFFFFB300), // Jaune
    Color(0xFF8E24AA), // Violet
    Color(0xFF00ACC1), // Cyan
    Color(0xFFFF8F00), // Ambre
    Color(0xFF5E35B1), // Indigo
    Color(0xFF00897B), // Teal
    Color(0xFFD81B60), // Rose
  ];
  
  // Helper methods
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }
  
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
