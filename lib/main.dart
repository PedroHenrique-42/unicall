import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unicall/constants/navigation_routes.dart';
import 'package:unicall/screens/home_screen.dart';
import 'package:unicall/screens/register_list_screen.dart';
import 'package:unicall/themes/main_light_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainLightTheme,
      routes: {
        homeScreen: (context) => const HomeScreen(),
        registerListScreen: (context) => const ListRegistersScreen(),
      },
    );
  }
}
