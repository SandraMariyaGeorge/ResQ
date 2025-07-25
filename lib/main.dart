import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resq/firebase_options.dart';
import 'package:resq/models/alerts.dart';
import 'package:resq/services/auth/auth_gate.dart';
import 'package:resq/services/local_notifications.dart';
import 'package:resq/services/location_service.dart';
import 'package:resq/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationService()),
        ChangeNotifierProvider(create: (context) => Alerts()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),

      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}