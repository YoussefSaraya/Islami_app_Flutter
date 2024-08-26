import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/Settings/language_bottom_sheet.dart';
import 'package:islami/Settings/theme_bottom_sheet.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart'; // Import Provider package

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.primaryLightColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: provider.isDarkMode()
          ? Theme.of(context).primaryColor
          : AppColors.whiteColor,
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: provider.isDarkMode()
          ? Theme.of(context).primaryColor
          : AppColors.whiteColor,
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
