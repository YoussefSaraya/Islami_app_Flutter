import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeeth/hadeeth_details_screen.dart';
import 'package:islami/Home/Hadeeth/hadeeth_tab.dart';

class ItemHadeethName extends StatelessWidget {
  Hadeeth hadeeth;

  ItemHadeethName({required this.hadeeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadeethDetailsScreen.routeName, arguments: hadeeth);
      },
      child: Text(
        hadeeth.title,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
