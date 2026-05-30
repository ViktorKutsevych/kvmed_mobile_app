// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DynamicMedIcon extends StatefulWidget {
  const DynamicMedIcon({
    super.key,
    this.width,
    this.height,
    this.typeString,
  });

  final double? width;
  final double? height;
  final String? typeString;

  @override
  State<DynamicMedIcon> createState() => _DynamicMedIconState();
}

class _DynamicMedIconState extends State<DynamicMedIcon> {
  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    double iconSize = widget.width ?? 24.0;

    switch (widget.typeString) {
      case 'Таблетки':
        iconWidget = FaIcon(FontAwesomeIcons.tablets,
            size: iconSize, color: const Color(0xFF448AFF));
        break;
      case 'Краплі':
        iconWidget = Icon(Icons.water_drop_outlined,
            size: iconSize, color: const Color(0xFF03A9F4));
        break;
      case 'Капсули':
        iconWidget = FaIcon(FontAwesomeIcons.pills,
            size: iconSize, color: const Color(0xFF448AFF));
        break;
      case 'Ін\'єкції':
        iconWidget = Icon(Icons.vaccines,
            size: iconSize, color: const Color(0xFF00BCD4));
        break;
      case 'Грам':
        iconWidget = FaIcon(FontAwesomeIcons.weightHanging,
            size: iconSize, color: const Color(0xFF5C6BC0));
        break;
      case 'Міліграм':
        iconWidget = FaIcon(FontAwesomeIcons.balanceScaleRight,
            size: iconSize, color: const Color(0xFF26A69A));
        break;
      case 'Мілілітр':
        iconWidget = Icon(Icons.local_drink_outlined,
            size: iconSize, color: const Color(0xFF03A9F4));
        break;
      case 'Ложки':
        iconWidget = FaIcon(FontAwesomeIcons.utensilSpoon,
            size: iconSize, color: const Color(0xFF448AFF));
        break;
      default:
        iconWidget = Icon(Icons.local_hospital,
            size: iconSize, color: const Color(0xFF448AFF));
    }

    return iconWidget;
  }
}
