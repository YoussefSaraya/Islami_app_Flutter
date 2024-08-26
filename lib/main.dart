import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeeth/hadeeth_details_screen.dart';
import 'package:islami/Home/Quran/sura_details_screen.dart';
import 'package:islami/Home/home_screen.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        theme: MyThemeData.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen()
      },
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
