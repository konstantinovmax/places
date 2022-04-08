import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_typography.dart';

// Класс для отображения карточки с достопримечательностью
class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          alignment: Alignment.topCenter,
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sight.type.toLowerCase(),
                  style: AppTypography.text14BoldWhite,
                ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.asset(AppAssets.heartIcon),
                ),
              ],
            ),
          ),
        ),
        DecoratedBox(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  sight.name,
                  style: AppTypography.text16MediumOxfordBlue,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  sight.details,
                  style: AppTypography.text14RegularWaterloo,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
