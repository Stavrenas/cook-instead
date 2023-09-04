import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/recipe.dart';

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.tag,
    required this.color,
  });

  final String tag;
  final String color;

  @override
  Widget build(BuildContext context) {
    var color = Color(int.parse(this.color, radix: 16));
    return FilterChip(
      elevation: 4.0,
      side: BorderSide(
        color: color.withOpacity(0.5),
        width: 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      label: Text(
        tag,
        style: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      shadowColor: color,
      backgroundColor: color.withOpacity(0.7),
      onSelected: (bool value) {

      },
    );
  }
}
