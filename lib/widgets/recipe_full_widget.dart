import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/recipe.dart';

class RecipeFullWidget extends StatelessWidget {
// The Recipe object to display
  final Recipe recipe;

// Constructor that takes the Recipe object as an argument
  RecipeFullWidget({required this.recipe});

// A helper method that returns a list of widgets for the ingredients
  List<Widget> _buildIngredients() {
// Create an empty list of widgets
    List<Widget> widgets = [];

// Loop through the ingredients list in the recipe object
    for (String ingredient in recipe.ingredients) {
// Add a Text widget for each ingredient with some padding and styling
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

// Return the list of widgets
    return widgets;
  }

// A helper method that returns a list of widgets for the tags
  List<Widget> _buildTags() {
// Create an empty list of widgets
    List<Widget> widgets = [];

// Loop through the tags list in the recipe object
    for (String tag in recipe.tags) {
// Add a Chip widget for each tag with some padding and styling
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

// Return the list of widgets
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
// Return a Scaffold widget that contains the recipe details
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
// A Container widget that displays the first image in the recipe object
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
// A Padding widget that displays the subtitle and the main text in the recipe object
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
// A Divider widget to separate the sections
              Divider(),
// A Padding widget that displays the ingredients title and the ingredients list
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
// A Wrap widget that displays the ingredients list using the _buildIngredients method
                    Wrap(
                      children: _buildIngredients(),
                    ),
                  ],
                ),
              ),
// A Divider widget to separate the sections
              Divider(),
// A Padding widget that displays the description title and the description text in the recipe object
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
// A Divider widget to separate the sections
              Divider(),
// A Padding widget that displays the tags title and the tags list
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
// A Wrap widget that displays the tags list using the _buildTags method
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
