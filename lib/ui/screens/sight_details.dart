import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';

// Экран с детальной информацией о достопримечательности
class SightDetails extends StatelessWidget {
  const SightDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sight = ModalRoute.of(context)!.settings.arguments as Sight;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SightDetailsImage(sight: sight),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppAssets.arrowIcon,
                        color: theme.indicatorColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SightDetailsContent(sight: sight, theme: theme),
                const SizedBox(
                  height: 24.0,
                ),
                SightDetailsSubmitButton(theme: theme),
                const SizedBox(
                  height: 24.0,
                ),
                Divider(
                  height: 1.0,
                  thickness: 0.0,
                  color: AppColors.waterlooColor.withOpacity(0.6),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SightDetailsActionButtons(theme: theme),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SightDetailsImage extends StatelessWidget {
  final Sight sight;

  const SightDetailsImage({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.0,
      child: Image.network(
        sight.url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, widget, loadingProgress) {
          if (loadingProgress != null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return widget;
        },
      ),
    );
  }
}

class SightDetailsContent extends StatelessWidget {
  final Sight sight;
  final ThemeData theme;

  const SightDetailsContent({
    Key? key,
    required this.sight,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sight.name,
          style: theme.textTheme.headline2,
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          children: [
            Text(
              sight.type.toLowerCase(),
              style: theme.textTheme.headline1,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              'время работы',
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          sight.details,
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}

class SightDetailsSubmitButton extends StatelessWidget {
  final ThemeData theme;

  const SightDetailsSubmitButton({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        onPressed: () {
          print('Button "${AppStrings.createRoute}" is pressed');
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => theme.canvasColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.directionIcon),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              AppStrings.createRoute.toUpperCase(),
              style: theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}

class SightDetailsActionButtons extends StatelessWidget {
  final ThemeData theme;

  const SightDetailsActionButtons({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              print('Button "${AppStrings.schedule}" is pressed');
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.calendarIcon,
                  color: theme.disabledColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  AppStrings.schedule,
                  style: theme.textTheme.bodyText1,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              print('Button "${AppStrings.toFavorites}" is pressed');
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.heartIcon,
                  color: theme.indicatorColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  AppStrings.toFavorites,
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
