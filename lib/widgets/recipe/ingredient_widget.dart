import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget{
  const IngredientWidget({Key? key, required this.ingredients, required this.color}) : super(key: key);

  final List<String> ingredients;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color.withOpacity(0.5),
      child: Column(
        children: [
          Text('Ingredients',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Jetskisinsummer',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,)
          ,
          Divider(color: Colors.white),
          for (String ingredient in ingredients) ...[
            Text(ingredient),
          ],
        ],
      ),
    );
  }
}