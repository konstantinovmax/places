import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/my_coordinates.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'dart:math' as math;

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var myCoordinates = MyCoordinates(lat: 59.7722654, lon: 30.3239842);
  var selectedRange = RangeValues(100, 10000);
  List<Sight> filteredPlaces = [];
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
            onPressed: () {
              rejectCategories();
            },
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
              filteredPlaces: filteredPlaces,
              filteringFunction: filteringSightByDistance,
              selectedRange: selectedRange,
              updateSelectedRange: updateSelectedRange,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FiltersScreenSubmitButton(
          theme: theme,
          filteredPlaces: filteredPlaces,
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
    });
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

  void updateSelectedRange(RangeValues newRange) {
    setState(() {
      selectedRange = newRange;
    });
    filteringSightByDistance();
  }

  void filteringSightByDistance() {
    mocks.forEach((place) {
      bool isNear = sightsNear(place, myCoordinates, selectedRange);
      if (isNear && !filteredPlaces.contains(place)) {
        setState(() {
          filteredPlaces.add(place);
        });
      }
    });
  }

  bool sightsNear(
    Sight sight,
    MyCoordinates myPosition,
    RangeValues selectedRange,
  ) {
    var ky = 4000000 / 360;
    var kx = math.cos(math.pi * myPosition.lat / 180.0) * ky;
    var dx = (myPosition.lon - sight.lon).abs() * kx;
    var dy = (myPosition.lat - sight.lat).abs() * ky;
    var squareRoot = math.sqrt(dx * dx + dy * dy);
    return squareRoot >= selectedRange.start && squareRoot <= selectedRange.end;
  }
}

class FiltersScreenCategories extends StatelessWidget {
  final bool isHotelSelected;
  final bool isRestaurantSelected;
  final bool isSpecialPlaceSelected;
  final bool isParkSelected;
  final bool isMuseumSelected;
  final bool isCafeSelected;
  final Function selectHotelToggler;
  final Function selectRestaurantToggler;
  final Function selectSpecialPlaceToggler;
  final Function selectParkToggler;
  final Function selectMuseumToggler;
  final Function selectCafeToggler;
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
  final Function selectCategoryToggler;
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
            onTap: () {
              selectCategoryToggler();
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
                      icon,
                      color: AppColors.fruitSaladColor,
                      fit: BoxFit.contain,
                    )),
                  ),
                  if (isSelected)
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
          Text(label, style: AppTypography.text12RegularOxfordBlue),
        ],
      ),
    );
  }
}

class FiltersScreenSlider extends StatelessWidget {
  final List<Sight> filteredPlaces;
  final Function filteringFunction;
  final RangeValues selectedRange;
  final Function updateSelectedRange;
  const FiltersScreenSlider({
    Key? key,
    required this.filteredPlaces,
    required this.filteringFunction,
    required this.selectedRange,
    required this.updateSelectedRange,
  }) : super(key: key);

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
              updateSelectedRange(newRange);
              filteringFunction();
            },
            min: 100,
            max: 10000,
          ),
        ),
      ],
    );
  }
}

class FiltersScreenSubmitButton extends StatelessWidget {
  final ThemeData theme;
  final List<Sight> filteredPlaces;

  const FiltersScreenSubmitButton({
    Key? key,
    required this.theme,
    required this.filteredPlaces,
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
            Text(
              '${AppStrings.show.toUpperCase()} (${filteredPlaces.length})',
              style: theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
