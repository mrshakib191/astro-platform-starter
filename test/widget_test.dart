import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chairman_para_app/main.dart';
import 'package:chairman_para_app/features/auth/screens/login_screen.dart';

// Mock Firebase initialization
Future<void> setupFirebase() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  try {
    // This is a workaround for the test environment.
    // In a real app, you would use a mock Firebase implementation.
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyALS0wiOIaK92Uy7nVgQmE6rE0LIKFkS5w",
        authDomain: "twegc-college.firebaseapp.com",
        databaseURL: "https://twegc-college-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "twegc-college",
        storageBucket: "twegc-college.firebasestorage.app",
        messagingSenderId: "1027416252835",
        appId: "1:1027416252835:web:2bb3e054c3652a27fd7a16"
      ),
    );
  } catch (e) {
    // Ignore if already initialized
  }
}

void main() {
  setUpAll(() async {
    await setupFirebase();
  });

  testWidgets('App starts with LoginScreen when not logged in', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(); // Wait for the stream builder to settle

    // Verify that LoginScreen is present.
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
