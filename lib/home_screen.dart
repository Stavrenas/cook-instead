import 'package:cook_instead/abstract_screen.dart';
import 'package:cook_instead/widgets/recipe/recipe_short_widget.dart';
import 'package:flutter/material.dart';

import 'domain/recipe.dart';
import 'firebase/firebase.dart';

class MyHomePage extends MyAbstractPage {
  const MyHomePage({super.key, required super.title, required super.subtitle, required super.content});

}

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
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
    );
  }
}