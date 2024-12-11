// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction() async {
  // row disappear after pressing accpet

  // Perform any necessary actions before row disappears

  // Wait for a short delay before removing the row
  await Future.delayed(Duration(milliseconds: 500));

  // Remove the row from the UI
  setState(() {
    // Update the list of rows to remove the row that was accepted
    var rows;
    rows.removeWhere((row) => row.isAccepted);
  });
}

void setState(Null Function() param0) {}
