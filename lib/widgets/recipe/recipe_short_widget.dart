import 'package:cook_instead/widgets/recipe/tag.dart';
import 'package:cook_instead/widgets/recipe/title_text.dart';
import 'package:flutter/material.dart';

import '../../domain/recipe.dart';

class RecipeShortWidget extends StatelessWidget {
  final Recipe recipe;

  RecipeShortWidget({required this.recipe});

// A helper method that returns a list of widgets for the tags
  List<Widget> _buildTags() {
    List<Widget> widgets = [];
    for (String tag in recipe.tags) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Tag(tag: tag, color: recipe.color),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var padding = 16.0;
    var elevation = 4.0;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/recipe', arguments: recipe),
      child: Card(
        elevation: elevation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  color:
                  Color(int.parse(recipe.color, radix: 16)).withOpacity(0.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (recipe.imagesUrls.isNotEmpty) ...[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(recipe.imagesUrls[0],
                                    height: (MediaQuery.of(context).size.width) / 2 -
                                        padding -
                                        elevation,
                                    width: (MediaQuery.of(context).size.width) / 2 -
                                        padding -
                                        elevation),
                                Container(
                                  alignment: Alignment.center,
                                  width: (MediaQuery.of(context).size.width) / 2 -
                                      padding -
                                      elevation,
                                  height: (MediaQuery.of(context).size.width) / 2 -
                                      padding -
                                      elevation,
                                  child: TitleText(title: recipe.title),
                                )
                              ]),
                        ] else ...[
                          TitleText(title: recipe.title),
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
      ),
    );
  }
}



