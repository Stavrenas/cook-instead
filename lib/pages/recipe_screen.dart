import 'package:cook_instead/widgets/common/app_bar.dart';
import 'package:cook_instead/widgets/recipe/recipe_full_widget.dart';
import 'package:flutter/material.dart';

import '../domain/recipe.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    final recipeFromArgs = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(recipeFromArgs.color, radix: 16)),
        title: AppBarTitle(recipeFromArgs.title).build(context),
      ),
      body: RecipeFullWidget(recipe: recipeFromArgs),
    );
  }
}
