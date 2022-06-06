import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/my_coordinates.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'dart:math' as math;

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppAssets.arrowIcon,
            color: AppColors.martiniqueColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              AppStrings.clear,
              style: AppTypography.text16MediumFruitSalad,
            ),
          ),
          const SizedBox(width: 16.0),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            FiltersScreenCategories(),
            const SizedBox(height: 56.0),
            FiltersScreenSlider(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FiltersScreenSubmitButton(theme: theme),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class FiltersScreenCategories extends StatelessWidget {
  const FiltersScreenCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.categories.toUpperCase(),
              style: AppTypography.text12RegularWaterloo,
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 40.0,
          spacing: 12.0,
          children: [
            FiltersScreenCategory(
              icon: AppAssets.hotelIcon,
              label: AppStrings.hotel,
            ),
            FiltersScreenCategory(
              icon: AppAssets.restaurantIcon,
              label: AppStrings.restaurant,
            ),
            FiltersScreenCategory(
              icon: AppAssets.specialPlaceIcon,
              label: AppStrings.specialPlace,
            ),
            FiltersScreenCategory(
              icon: AppAssets.parkIcon,
              label: AppStrings.park,
            ),
            FiltersScreenCategory(
              icon: AppAssets.museumIcon,
              label: AppStrings.museum,
            ),
            FiltersScreenCategory(
              icon: AppAssets.cafeIcon,
              label: AppStrings.cafe,
            ),
          ],
        ),
      ],
    );
  }
}

class FiltersScreenCategory extends StatefulWidget {
  final String icon;
  final String label;
  const FiltersScreenCategory({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  State<FiltersScreenCategory> createState() => _FiltersScreenCategoryState();
}

class _FiltersScreenCategoryState extends State<FiltersScreenCategory> {
  late bool isMarked;

  @override
  void initState() {
    deselectFilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.0,
      height: 92.0,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isMarked = !isMarked;
              });
            },
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            child: SizedBox(
              width: 64.0,
              height: 64.0,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.fruitSaladColor.withOpacity(0.16),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: SvgPicture.asset(
                      widget.icon,
                      color: AppColors.fruitSaladColor,
                      fit: BoxFit.contain,
                    )),
                  ),
                  if (isMarked)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color: AppColors.martiniqueColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(AppAssets.checkMarkIcon),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(widget.label, style: AppTypography.text12RegularOxfordBlue),
        ],
      ),
    );
  }

  void deselectFilter() {
    isMarked = false;
  }
}

class FiltersScreenSlider extends StatefulWidget {
  const FiltersScreenSlider({Key? key}) : super(key: key);

  @override
  State<FiltersScreenSlider> createState() => _FiltersScreenSliderState();
}

class _FiltersScreenSliderState extends State<FiltersScreenSlider> {
  var selectedRange = RangeValues(100, 10000);
  var myCoordinates = MyCoordinates(lat: 59.7722654, lon: 30.3239842);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.distance,
              style: AppTypography.text16RegularMartinique,
            ),
            Text(
              'От ${selectedRange.start.ceil()} до ${selectedRange.end.ceil()} м',
              style: AppTypography.text16RegularWaterloo,
            )
          ],
        ),
        const SizedBox(height: 24.0),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayShape: SliderComponentShape.noOverlay,
            thumbColor: AppColors.whiteColor,
            activeTrackColor: AppColors.fruitSaladColor,
            inactiveTrackColor: AppColors.waterlooColor.withOpacity(0.56),
            trackHeight: 2.0,
          ),
          child: RangeSlider(
            values: selectedRange,
            onChanged: (newRange) {
              setState(() {
                selectedRange = newRange;
              });
            },
            min: 100,
            max: 10000,
          ),
        ),
      ],
    );
  }

  void sightsNear(checkPoint, centerPoint, km) {
    var ky = 40000000 / 360;
    var kx = math.cos(math.pi * centerPoint.lat / 180.0) * ky;
    var dx = (centerPoint.lon - checkPoint.lon).abs() * kx;
    var dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
    print(math.sqrt(dx * dx + dy * dy) <= km);
  }
}

class FiltersScreenSubmitButton extends StatelessWidget {
  final ThemeData theme;
  const FiltersScreenSubmitButton({Key? key, required this.theme})
      : super(key: key);

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
            Text(
              AppStrings.show.toUpperCase(),
              style: theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
