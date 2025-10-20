import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chairman_para_app/features/auth/screens/login_screen.dart';
import 'package:chairman_para_app/features/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'চেয়ারম্যান-পাড়া ঐক্য ও কল্যাণ অ্যাপ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
