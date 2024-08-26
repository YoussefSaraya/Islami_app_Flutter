import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode()
          ? AppColors.primaryDarkColor
          : AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },

            ///dark
            child: provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ///change to light
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode()
                ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                : getSelectedItemWidget(
                    AppLocalizations.of(context)!.light,
                  ),
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
