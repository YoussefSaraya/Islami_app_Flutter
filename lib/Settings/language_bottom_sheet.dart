import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode() ? AppColors.primaryDarkColor : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                : getUnselectedItemWidget(
                    AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: provider.isDarkMode()
                  ? AppColors.goldColor
                  : Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: provider.isDarkMode()
              ? AppColors.goldColor
              : Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
