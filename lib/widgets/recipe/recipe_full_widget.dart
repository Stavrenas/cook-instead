import 'package:cook_instead/widgets/recipe/ingredient_widget.dart';
import 'package:cook_instead/widgets/recipe/title_text.dart';
import 'package:flutter/material.dart';

import '../../domain/recipe.dart';

class RecipeFullWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeFullWidget({required this.recipe});

  List<Widget> _buildTags() {
    List<Widget> widgets = [];

    for (String tag in recipe.tags) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Chip(
            label: Text(
              tag,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(int.parse(recipe.color, radix: 16)),
          ),
        ),
      );
    }

    return widgets;
  }

  List<Widget> _buildImages(double screenWidth) {
    return [
      for (String imageUrl in recipe.imagesUrls)
        SizedBox(
          width: screenWidth,
          height: screenWidth,
          child: Image.network(imageUrl),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = 16.0;
    return Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: screenSize.width,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: _buildImages(screenSize.width)),
            ),
            TitleText(
              title: recipe.subtitle,
              color: Colors.black,
            ),
            Text(recipe.description),
            Padding(padding: EdgeInsets.only(top: padding)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: screenSize.width / 2 - 2 * padding,
                  height: screenSize.width / 2,
                  child: IngredientWidget(
                    ingredients: recipe.ingredients,
                    color: Color(int.parse(recipe.color, radix: 16)),
                  )),
              Padding(
                  padding: EdgeInsets.all(padding),
                  child: SizedBox(
                    width: screenSize.width / 2 - 2 * padding,
                    height: screenSize.width / 2,
                    child: Text(
                      recipe.maintext,
                      softWrap: true,
                    ),
                  ))
            ]),
          ],
        )));
  }
}
