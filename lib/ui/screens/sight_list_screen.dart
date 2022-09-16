import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/models/sight_model.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/sight_card.dart';

// Экран для отображения списка карточек с достопримечательностями
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final TextEditingController textController = TextEditingController();
  List<SightModel> places = mocks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              toolbarHeight: 70.0,
              elevation: 0.0,
              title: Text(
                AppStrings.listOfInterestingPlaces2,
                style: theme.textTheme.headline3,
                maxLines: 2,
              ),
              centerTitle: false,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
              child: TextField(
                autofocus: true,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.sightSearchScreenRoute,
                    arguments: places,
                  );
                },
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SvgPicture.asset(AppAssets.searchIcon),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 24.0,
                    minHeight: 24.0,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async {
                        await showDialog<Widget>(
                          context: context,
                          builder: (c) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return const FiltersScreen();
                              },
                            );
                          },
                        );
                        setState(() {
                          if (filteredPlaces.isNotEmpty) {
                            places = filteredPlaces;
                          }
                        });
                      },
                      icon: SvgPicture.asset(AppAssets.filterIcon),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 24.0,
                    minHeight: 24.0,
                  ),
                  filled: true,
                  fillColor: AppColors.wildSandColor,
                  hintText: AppStrings.search,
                  hintStyle: AppTypography.text16RegularWaterloo,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
                style: AppTypography.text16RegularMartinique,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              children: List.generate(
                places.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: SightCard(
                      sight: places[index],
                      isHaveCalendarOrShareIcon: false,
                      calendarOrShareIcon: '',
                      addOrRemoveIcon: AppAssets.heartIcon,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 177.0,
        height: 48.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.birghtSunColor, AppColors.fruitSaladColor],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addSightScreenRoute);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.plusIcon),
              const SizedBox(width: 8.0),
              Text(
                AppStrings.newPlace.toUpperCase(),
                style: AppTypography.text14BoldWhite,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
