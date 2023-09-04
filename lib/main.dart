import 'package:cook_instead/widgets/recipe/recipe_full_widget.dart';
import 'package:cook_instead/widgets/recipe/recipe_short_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cook_instead/firebase/firebase.dart';
import 'package:cook_instead/domain/recipe.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
    );
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cook instead'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(
          fontFamily: 'Jetskisinsummer',
        )),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: readRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Size screenSize = MediaQuery.of(context).size;
            return SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return RecipeShortWidget(recipe: snapshot.data![index]);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
