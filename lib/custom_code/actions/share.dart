// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future share() async {
  // share habits with others

  // Get the habits to share
  List<Habit> habits = await getHabits();

  // Convert the habits to a list of strings
  List<String> habitStrings = habits.map((habit) => habit.name).toList();

  // Create a message to share
  String message = "Check out my habits: ${habitStrings.join(", ")}";

  // Share the message using the share plugin
  await Share.share(message);
}
