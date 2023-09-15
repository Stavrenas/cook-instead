import 'package:flutter/material.dart';

import '../../domain/recipe.dart';

class RecipeFullWidget extends StatelessWidget {

  final Recipe recipe;

  RecipeFullWidget({required this.recipe});

  List<Widget> _buildIngredients() {

    List<Widget> widgets = [];

    for (String ingredient in recipe.ingredients) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ingredient,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return widgets;
  }

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

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width - 50,
      width: screenSize.width - 50,
      child: Scaffold(
        appBar: AppBar(
          title: Text(recipe.title),
          backgroundColor: Color(int.parse(recipe.color, radix: 16)),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.subtitle,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(recipe.color, radix: 16)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      recipe.maintext,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(recipe.color, radix: 16)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Wrap(
                      children: _buildIngredients(),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(recipe.color, radix: 16)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      recipe.description,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tags',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(int.parse(recipe.color, radix: 16)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Wrap(
                      children: _buildTags(),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
