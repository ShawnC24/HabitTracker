import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCQcsgof9CUiWqMyX-yDcsUEsf-f3q53vQ",
            authDomain: "habit-tracker-e0yet4.firebaseapp.com",
            projectId: "habit-tracker-e0yet4",
            storageBucket: "habit-tracker-e0yet4.firebasestorage.app",
            messagingSenderId: "551210272535",
            appId: "1:551210272535:web:c1e1b0db2a5a243879d952"));
  } else {
    await Firebase.initializeApp();
  }
}
