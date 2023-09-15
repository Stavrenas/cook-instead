import 'package:flutter/material.dart';

abstract class MyAbstractPage extends StatefulWidget {
  const MyAbstractPage({super.key, required this.title, required this.subtitle, required this.content});

  final String title;

  final String subtitle;

  final Widget content;

  @override
  State<MyAbstractPage> createState() => _MyAbstractPageState();
}

class _MyAbstractPageState extends State<MyAbstractPage> {

  _MyAbstractPageState();

  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    if(widget.subtitle.isNotEmpty){
      title = "$title - ${widget.subtitle}";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title,
            style: TextStyle(
              fontFamily: 'Jetskisinsummer',
            )),
      ),
      body: widget.content,
    );
  }


}
