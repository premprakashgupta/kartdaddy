import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor() {
    String hexCode = this.replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse(hexCode, radix: 16));
  }
}
