import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/sight_card.dart';

// Экран для отображения списка карточек с достопримечательностями
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
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
                AppStrings.listOfInterestingPlaces,
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
          children: List.generate(
            mocks.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: SightCard(
                  sight: mocks[index],
                  isHaveCalendarOrShareIcon: false,
                  calendarOrShareIcon: '',
                  addOrRemoveIcon: AppAssets.heartIcon,
                ),
              ),
            ),
          ),
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
