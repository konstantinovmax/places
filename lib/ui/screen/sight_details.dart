import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

// Экран с детальной информацией о достопримечательности
class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SightDetailsImage(sight: sight),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SightDetailsContent(sight: sight),
                const SizedBox(
                  height: 24.0,
                ),
                const SightDetailsSubmitButton(),
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
                const SightDetailsActionButtons(),
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

  const SightDetailsContent({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sight.name,
          style: AppTypography.text24BoldOxfordBlue,
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          children: [
            Text(
              sight.type.toLowerCase(),
              style: AppTypography.text14BoldOxfordBlue,
            ),
            const SizedBox(
              width: 16.0,
            ),
            const Text(
              'время работы',
              style: AppTypography.text14RegularWaterloo,
            ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          sight.details,
          style: AppTypography.text14RegularWaterloo,
        ),
      ],
    );
  }
}

class SightDetailsSubmitButton extends StatelessWidget {
  const SightDetailsSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.fruitSaladColor,
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
              AppStrings.createRoute.toLowerCase(),
              style: AppTypography.text14BoldWhite,
            ),
          ],
        ),
      ),
    );
  }
}

class SightDetailsActionButtons extends StatelessWidget {
  const SightDetailsActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.calendarIcon),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  AppStrings.schedule,
                  style: AppTypography.text14RegularWaterloo,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.heartIcon,
                  color: AppColors.oxfordBlueColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  AppStrings.toFavorites,
                  style: AppTypography.text14RegularWaterloo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
