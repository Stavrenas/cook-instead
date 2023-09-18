import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitle {

  final String title;

  final String subtitle;

  AppBarTitle(this.title,[this.subtitle='']);

  Widget build(BuildContext context){
    String finalTitle = title;
    if (subtitle.isNotEmpty) {
      finalTitle = "$title - ${subtitle}";
    }
    return Text(
      finalTitle,
      style: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Jetskisinsummer',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

