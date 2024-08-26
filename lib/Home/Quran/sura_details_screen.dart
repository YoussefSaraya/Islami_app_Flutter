import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Quran/item_sura_details_screen.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadfile(args.index);
    }
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
            '${args.name}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : AppColors.primaryLightColor,
              ))
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.07),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemSuraDetailsScreen(
                      content: verses[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? AppColors.goldColor
                          : AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    ]);
  }

  int add(int n1, int n2) {
    return n1 + n2;
  }

  void loadfile(int index) async {
    add(10, 20);

    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> Lines = content.split('\n');
    for (int i = 0; i < Lines.length; i++) {
      print(Lines[i]);
    }
    verses = Lines;
    setState(() {});
  }
}

///data class
class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
