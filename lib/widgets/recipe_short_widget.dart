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
    var imageDims = 150.0;
    var padding = 16.0;
    var elevation = 4.0;
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color:
                    Color(int.parse(recipe.color, radix: 16)).withOpacity(0.5),
                child: Row(children: [
                  if (recipe.imagesUrls.isNotEmpty) ...[
                    Row(children: [
                      Image.network(recipe.imagesUrls[0],
                          height: (MediaQuery.of(context).size.width) / 2 -
                              padding -
                              elevation,
                          width: (MediaQuery.of(context).size.width) / 2 -
                              padding -
                              elevation),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) / 2 -
                            padding -
                            elevation,
                        height: (MediaQuery.of(context).size.width) / 2 -
                            padding -
                            elevation,
                        child: TitleText(recipe.title),
                      )
                    ]),
                  ] else ...[
                    TitleText(recipe.title)
                  ],
                ])),
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

  Text TitleText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Comic Sans MS',
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
