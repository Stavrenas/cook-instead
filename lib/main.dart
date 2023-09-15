import 'package:cook_instead/abstract_screen.dart';
import 'package:cook_instead/widgets/recipe/recipe_full_widget.dart';
import 'package:cook_instead/widgets/recipe/recipe_short_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cook_instead/firebase/firebase.dart';
import 'package:cook_instead/domain/recipe.dart';

import 'firebase_options.dart';
import 'home_screen.dart';

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
        home: MyHomePage(
          title: 'Cook Instead',
          subtitle: '',
          content: const RecipeList(),
        ));
  }
}
