import 'package:flutter_firebase/features/user_auth/presentation/pages/consts.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/progress_provider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/calendar_provider.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCveU5KbojDttseHWskzl2hDdMyVe4ZVMM",
            appId: "1:68412008648:web:311977f8e923850c8cddfd",
            messagingSenderId: "68412008648",
            projectId: "workitout-dd80b"));
  }

  await Firebase.initializeApp();
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProgressProvider()),
        ChangeNotifierProvider(create: (context) => CalendarProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPages(title: 'Login Page'),
    );
  }
}
