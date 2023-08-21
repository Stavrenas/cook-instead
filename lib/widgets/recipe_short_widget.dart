import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/recipe.dart';

class RecipeShortWidget extends StatelessWidget {
// The Recipe object to display
  final Recipe recipe;

// Constructor that takes the Recipe object as an argument
  RecipeShortWidget({required this.recipe});

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
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.images[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(recipe.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(recipe.color, radix: 16)),
                    )),
              ],
            ),
            Divider(),
            Text(recipe.description),
            Wrap(
              children: _buildTags(),
            )
          ],
        ),
      ),
    );
  }
}
