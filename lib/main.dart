import 'package:cook_instead/pages/recipe_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'util/firebase_options.dart';
import 'pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e, s) {
    print(s);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cook Instead',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => MyHomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/recipe': (context) => RecipePage(),
        },
        home: MyHomePage());
  }
}
