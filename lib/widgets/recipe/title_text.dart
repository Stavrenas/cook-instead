import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title, this.color = Colors.white});

  final String title;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Jetskisinsummer',
        fontWeight: FontWeight.bold,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}