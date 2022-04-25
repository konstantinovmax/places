import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
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
                      style: AppTypography.text14BoldWhite,
                    ),
                    Row(
                      children: [
                        if (isHaveCalendarOrShareIcon)
                          IconButton(
                            onPressed: () {},
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
                          onPressed: () {},
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
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.wildSandColor,
              borderRadius: BorderRadius.only(
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
                        style: AppTypography.text16MediumOxfordBlue,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      if (calendarOrShareIcon == AppAssets.calendarIcon) ...[
                        const Text(
                          '${AppStrings.scheduledFor} 12 окт. 2020',
                          style: AppTypography.text14RegularFruitSalad,
                          maxLines: 1,
                        ),
                      ] else if (calendarOrShareIcon ==
                          AppAssets.shareIcon) ...[
                        const Text(
                          '${AppStrings.goalAchieved} 12 окт. 2020',
                          style: AppTypography.text14RegularWaterloo,
                          maxLines: 1,
                        ),
                      ] else ...[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 2,
                          ),
                          child: Text(
                            sight.details,
                            style: AppTypography.text14RegularWaterloo,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    '${AppStrings.closedUntil.toLowerCase()} 09:00',
                    style: AppTypography.text14RegularWaterloo,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
