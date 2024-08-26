import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeeth/hadeeth_tab.dart';
import 'package:islami/Home/Hadeeth/item_hadeeth_details_screen.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class HadeethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeeth_details';

  @override
  State<HadeethDetailsScreen> createState() => _HadeethDetailsScreenState();
}

class _HadeethDetailsScreenState extends State<HadeethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeeth;

    return Stack(children: [
      Image.asset(
        provider.isDarkMode()
            ? 'assets/images/background_dark.png'
            : 'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.07),
          decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? AppColors.primaryDarkColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadeethDetailsScreen(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
