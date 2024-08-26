import 'package:flutter/material.dart';

class ItemHadeethDetailsScreen extends StatelessWidget {
  String content;

  ItemHadeethDetailsScreen({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
