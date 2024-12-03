import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? newCustomFunction() {
  // i need a function where if you reach 100% on a slider, it will changed the text from in progress to completed, anything under 100% will be in progress
  double sliderValue =
      100.0; // This value should be replaced with the actual value of the slider

  if (sliderValue == 100.0) {
    return 'Completed';
  } else {
    return 'In Progress';
  }
}
