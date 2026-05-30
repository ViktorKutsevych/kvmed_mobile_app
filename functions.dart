import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<DateTime> getSevenDays() {
  DateTime today = DateTime.now();
  return List.generate(7, (i) => today.add(Duration(days: i)));
}

MedicationRecordStruct? findMedicationForNow(
  List<MedicationRecordStruct>? medsList,
  DateTime? currentTime,
) {
  if (medsList == null || medsList.isEmpty || currentTime == null) {
    return null;
  }

  for (var med in medsList) {
    if (med.exactTime != null) {
      if (med.exactTime!.hour == currentTime.hour &&
          med.exactTime!.minute == currentTime.minute) {
        return med;
      }
    }
  }

  return null;
}
