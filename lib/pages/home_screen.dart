import 'package:cook_instead/widgets/recipe/recipe_short_widget.dart';
import 'package:flutter/material.dart';

import '../domain/recipe.dart';
import '../util/firebase/firebase.dart';
import '../widgets/common/app_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AppBarTitle('Cook Instead').build(context),
      ),
      body: RecipeList(),
    );
  }
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
