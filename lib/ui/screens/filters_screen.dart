// ignore_for_file: avoid_print

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/models/my_coordinates_model.dart';
import 'package:places/domain/models/sight_model.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  MyCoordinatesModel myCoordinates =
      const MyCoordinatesModel(lat: 59.820413, lon: 30.322472);
  RangeValues selectedDistance = const RangeValues(100.0, 10000.0);
  List<SightModel> searchingItems = [];
  bool isHotelSelected = false;
  bool isRestaurantSelected = false;
  bool isSpecialPlaceSelected = false;
  bool isParkSelected = false;
  bool isMuseumSelected = false;
  bool isCafeSelected = false;

  @override
  void initState() {
    filteringSightByDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print(selectedDistance);

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
            onPressed: rejectCategories,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
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
            FiltersScreenCategories(
              isHotelSelected: isHotelSelected,
              isRestaurantSelected: isRestaurantSelected,
              isSpecialPlaceSelected: isSpecialPlaceSelected,
              isParkSelected: isParkSelected,
              isMuseumSelected: isMuseumSelected,
              isCafeSelected: isCafeSelected,
              selectHotelToggler: selectHotelToggler,
              selectRestaurantToggler: selectRestaurantToggler,
              selectSpecialPlaceToggler: selectSpecialPlaceToggler,
              selectParkToggler: selectParkToggler,
              selectMuseumToggler: selectMuseumToggler,
              selectCafeToggler: selectCafeToggler,
            ),
            const SizedBox(height: 56.0),
            FiltersScreenSlider(
              searchingItems: searchingItems,
              filteringFunction: filteringSightByDistance,
              selectedDistance: selectedDistance,
              updateSelectedDistance: updateSelectedDistance,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FiltersScreenSubmitButton(
          theme: theme,
          searchingItems: searchingItems,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void rejectCategories() {
    setState(() {
      isHotelSelected = false;
      isRestaurantSelected = false;
      isSpecialPlaceSelected = false;
      isParkSelected = false;
      isMuseumSelected = false;
      isCafeSelected = false;
      selectedDistance = const RangeValues(100.0, 10000.0);
    });
    filteringSightByDistance();
  }

  void selectHotelToggler() {
    setState(() {
      isHotelSelected = !isHotelSelected;
    });
  }

  void selectRestaurantToggler() {
    setState(() {
      isRestaurantSelected = !isRestaurantSelected;
    });
  }

  void selectSpecialPlaceToggler() {
    setState(() {
      isSpecialPlaceSelected = !isSpecialPlaceSelected;
    });
  }

  void selectParkToggler() {
    setState(() {
      isParkSelected = !isParkSelected;
    });
  }

  void selectMuseumToggler() {
    setState(() {
      isMuseumSelected = !isMuseumSelected;
    });
  }

  void selectCafeToggler() {
    setState(() {
      isCafeSelected = !isCafeSelected;
    });
  }

  void updateSelectedDistance(RangeValues newDistance) {
    setState(() {
      selectedDistance = newDistance;
    });
  }

  void filteringSightByDistance() {
    for (final place in mocks) {
      final isNear = sightsNear(place, myCoordinates, selectedDistance);
      if (isNear && !searchingItems.contains(place)) {
        setState(() {
          searchingItems.add(place);
        });
      } else if (!isNear && searchingItems.contains(place)) {
        setState(() {
          searchingItems.remove(place);
        });
      }
    }
  }

  bool sightsNear(
    SightModel sight,
    MyCoordinatesModel myPosition,
    RangeValues selectedDistance,
  ) {
    const ky = 40000000 / 360;
    final kx = math.cos(math.pi * myPosition.lat / 180.0) * ky;
    final dx = (myPosition.lon - sight.lon).abs() * kx;
    final dy = (myPosition.lat - sight.lat).abs() * ky;
    final squareRoot = math.sqrt(dx * dx + dy * dy);

    return squareRoot >= selectedDistance.start &&
        squareRoot <= selectedDistance.end;
  }
}

class FiltersScreenCategories extends StatelessWidget {
  final bool isHotelSelected;
  final bool isRestaurantSelected;
  final bool isSpecialPlaceSelected;
  final bool isParkSelected;
  final bool isMuseumSelected;
  final bool isCafeSelected;
  final void Function()? selectHotelToggler;
  final void Function()? selectRestaurantToggler;
  final void Function()? selectSpecialPlaceToggler;
  final void Function()? selectParkToggler;
  final void Function()? selectMuseumToggler;
  final void Function()? selectCafeToggler;
  const FiltersScreenCategories({
    Key? key,
    required this.isHotelSelected,
    required this.isRestaurantSelected,
    required this.isSpecialPlaceSelected,
    required this.isParkSelected,
    required this.isMuseumSelected,
    required this.isCafeSelected,
    required this.selectHotelToggler,
    required this.selectRestaurantToggler,
    required this.selectSpecialPlaceToggler,
    required this.selectParkToggler,
    required this.selectMuseumToggler,
    required this.selectCafeToggler,
  }) : super(key: key);

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
              isSelected: isHotelSelected,
              selectCategoryToggler: selectHotelToggler,
            ),
            FiltersScreenCategory(
              icon: AppAssets.restaurantIcon,
              label: AppStrings.restaurant,
              isSelected: isRestaurantSelected,
              selectCategoryToggler: selectRestaurantToggler,
            ),
            FiltersScreenCategory(
              icon: AppAssets.specialPlaceIcon,
              label: AppStrings.specialPlace,
              isSelected: isSpecialPlaceSelected,
              selectCategoryToggler: selectSpecialPlaceToggler,
            ),
            FiltersScreenCategory(
              icon: AppAssets.parkIcon,
              label: AppStrings.park,
              isSelected: isParkSelected,
              selectCategoryToggler: selectParkToggler,
            ),
            FiltersScreenCategory(
              icon: AppAssets.museumIcon,
              label: AppStrings.museum,
              isSelected: isMuseumSelected,
              selectCategoryToggler: selectMuseumToggler,
            ),
            FiltersScreenCategory(
              icon: AppAssets.cafeIcon,
              label: AppStrings.cafe,
              isSelected: isCafeSelected,
              selectCategoryToggler: selectCafeToggler,
            ),
          ],
        ),
      ],
    );
  }
}

class FiltersScreenCategory extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final void Function()? selectCategoryToggler;
  const FiltersScreenCategory({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.selectCategoryToggler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.0,
      height: 92.0,
      child: Column(
        children: [
          InkWell(
            onTap: selectCategoryToggler,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
                        icon,
                        color: AppColors.fruitSaladColor,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: const BoxDecoration(
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
          Text(label, style: AppTypography.text12RegularOxfordBlue),
        ],
      ),
    );
  }
}

class FiltersScreenSlider extends StatelessWidget {
  final List<SightModel> searchingItems;
  final void Function() filteringFunction;
  final RangeValues selectedDistance;
  final void Function(RangeValues) updateSelectedDistance;
  const FiltersScreenSlider({
    Key? key,
    required this.searchingItems,
    required this.filteringFunction,
    required this.selectedDistance,
    required this.updateSelectedDistance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppStrings.distance,
              style: AppTypography.text16RegularMartinique,
            ),
            Text(
              'От ${selectedDistance.start.ceil()} до ${selectedDistance.end.ceil()} м',
              style: AppTypography.text16RegularWaterloo,
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayShape: SliderComponentShape.noOverlay,
            thumbColor: AppColors.whiteColor,
            activeTrackColor: AppColors.fruitSaladColor,
            inactiveTrackColor: AppColors.waterlooColor.withOpacity(0.56),
            trackHeight: 2.0,
          ),
          child: RangeSlider(
            values: selectedDistance,
            onChanged: (newDistance) {
              updateSelectedDistance(newDistance);
              filteringFunction();
            },
            max: 10000,
          ),
        ),
      ],
    );
  }
}

class FiltersScreenSubmitButton extends StatefulWidget {
  final ThemeData theme;
  final List<SightModel> searchingItems;

  const FiltersScreenSubmitButton({
    Key? key,
    required this.theme,
    required this.searchingItems,
  }) : super(key: key);

  @override
  State<FiltersScreenSubmitButton> createState() =>
      _FiltersScreenSubmitButtonState();
}

class _FiltersScreenSubmitButtonState extends State<FiltersScreenSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        onPressed: () {
          filteredPlaces
            ..clear()
            ..addAll(widget.searchingItems);
          Navigator.pop(context);
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => widget.theme.canvasColor,
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
              '${AppStrings.show.toUpperCase()} (${widget.searchingItems.length})',
              style: widget.theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
