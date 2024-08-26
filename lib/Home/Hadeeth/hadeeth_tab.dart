import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeeth/item_hadeeth_name.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> ahadeethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadeethList.isEmpty) {
      loadHadeethFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/hadeeth_logo.png')),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.goldColor
              : AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadeethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                ) // Display a loading indicator while data is being fetched
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemHadeethName(
                      hadeeth: ahadeethList[index],
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
                  itemCount: ahadeethList.length),
        )
      ],
    );
  }

  void loadHadeethFile() async {
    String hadeethcontent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeethList = hadeethcontent.split('#\r\n');
    for (int i = 0; i < hadeethList.length; i++) {
      print(hadeethList[i]);
      List<String> HadeethLines = hadeethList[i].split('\n');
      String title = HadeethLines[0];
      HadeethLines.removeAt(0);
      Hadeeth hadeeth = Hadeeth(title: title, content: HadeethLines);
      ahadeethList.add(hadeeth);
      setState(() {});
    }
  }
}

class Hadeeth {
  String title;
  List<String> content;

  Hadeeth({required this.title, required this.content});
}
