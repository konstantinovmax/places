import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/theme/app_strings.dart';

// Класс для отображения карточки с достопримечательностью
class SightCard extends StatelessWidget {
  final Sight sight;
  final bool isHaveCalendarOrShareIcon;
  final String calendarOrShareIcon;
  final String addOrRemoveIcon;

  const SightCard({
    Key? key,
    required this.sight,
    required this.isHaveCalendarOrShareIcon,
    required this.calendarOrShareIcon,
    required this.addOrRemoveIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.detailsRoute, arguments: sight);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SightCardImage(
            sight: sight,
            theme: theme,
            isHaveCalendarOrShareIcon: isHaveCalendarOrShareIcon,
            calendarOrShareIcon: calendarOrShareIcon,
            addOrRemoveIcon: addOrRemoveIcon,
          ),
          SightCardDescription(
            sight: sight,
            theme: theme,
            calendarOrShareIcon: calendarOrShareIcon,
          ),
        ],
      ),
    );
  }
}

class SightCardImage extends StatelessWidget {
  final Sight sight;
  final ThemeData theme;
  final bool isHaveCalendarOrShareIcon;
  final String calendarOrShareIcon;
  final String addOrRemoveIcon;
  const SightCardImage({
    Key? key,
    required this.sight,
    required this.theme,
    required this.isHaveCalendarOrShareIcon,
    required this.calendarOrShareIcon,
    required this.addOrRemoveIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sight.type.toLowerCase(),
                  style: theme.textTheme.subtitle1,
                ),
                Row(
                  children: [
                    if (isHaveCalendarOrShareIcon)
                      IconButton(
                        onPressed: () {
                          print('Button is pressed');
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: SvgPicture.asset(calendarOrShareIcon),
                      )
                    else
                      const SizedBox(),
                    const SizedBox(
                      width: 16.0,
                    ),
                    IconButton(
                      onPressed: () {
                        print('Button is pressed');
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: SvgPicture.asset(addOrRemoveIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SightCardDescription extends StatelessWidget {
  final Sight sight;
  final ThemeData theme;
  final String calendarOrShareIcon;

  const SightCardDescription({
    Key? key,
    required this.sight,
    required this.theme,
    required this.calendarOrShareIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sight.name,
                  style: theme.textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                if (calendarOrShareIcon == AppAssets.calendarIcon) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '${AppStrings.scheduledFor} 12 окт. 2020',
                      style: theme.textTheme.caption,
                      maxLines: 1,
                    ),
                  ),
                ] else if (calendarOrShareIcon == AppAssets.shareIcon) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '${AppStrings.goalAchieved} 12 окт. 2020',
                      style: theme.textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  ),
                ] else ...[
                  const SizedBox(),
                ],
              ],
            ),
            Text(
              '${AppStrings.closedUntil.toLowerCase()} 09:00',
              style: theme.textTheme.bodyText1,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
