import 'package:flutter/material.dart';

// Mapping last digit → Material seed color (fixed mapping per spec)
// 0: indigo, 1: teal, 2: deepOrange, 3: blueGrey, 4: amber,
// 5: pink, 6: cyan, 7: deepPurple, 8: green, 9: red
Color seedColorFromNim(String nim) {
  final int lastDigit = int.tryParse(nim.trim().isEmpty
          ? '0'
          : nim.trim()[nim.trim().length - 1]) ??
      0;
  switch (lastDigit) {
    case 0:
      return Colors.indigo;
    case 1:
      return Colors.teal;
    case 2:
      return Colors.deepOrange;
    case 3:
      return Colors.blueGrey;
    case 4:
      return Colors.amber;
    case 5:
      return Colors.pink;
    case 6:
      return Colors.cyan;
    case 7:
      return Colors.deepPurple;
    case 8:
      return Colors.green;
    case 9:
      return Colors.red;
    default:
      return Colors.indigo;
  }
}


