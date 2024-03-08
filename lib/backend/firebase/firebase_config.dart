import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAJQ9kYjaaVHvnaD_qaLLB1_RqYQbj3wJM",
            authDomain: "sos-app-73sssq.firebaseapp.com",
            projectId: "sos-app-73sssq",
            storageBucket: "sos-app-73sssq.appspot.com",
            messagingSenderId: "317126118730",
            appId: "1:317126118730:web:f2ba4a0f18076aa88585b3"));
  } else {
    await Firebase.initializeApp();
  }
}
