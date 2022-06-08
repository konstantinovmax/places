import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/models/switch_theme_model.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';

class SettingsScreen extends StatelessWidget {
  final SwitchThemeModel switchTheme;
  const SettingsScreen({Key? key, required this.switchTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.settings,
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            SizedBox(
              height: 56.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.darkTheme,
                    style: theme.textTheme.headline4,
                  ),
                  CupertinoSwitch(
                    value: switchTheme.isDarkTheme,
                    onChanged: (value) {
                      switchTheme.changeTheme();
                    },
                    activeColor: AppColors.fruitSaladColor,
                    trackColor: AppColors.waterlooColor.withOpacity(0.56),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.0,
              thickness: 0.8,
              color: AppColors.waterlooColor.withOpacity(0.56),
            ),
            SizedBox(
              height: 56.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.watchTutorial,
                    style: theme.textTheme.headline4,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.infoIcon,
                      color: AppColors.fruitSaladColor,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.0,
              thickness: 0.8,
              color: AppColors.waterlooColor.withOpacity(0.56),
            ),
          ],
        ),
      ),
    );
  }
}
