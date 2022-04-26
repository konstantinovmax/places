import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: const Text(
            AppStrings.favorites,
            style: AppTypography.text18MediumMartinique,
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: Container(
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: AppColors.wildSandColor,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: const TabBar(
                    labelColor: AppColors.whiteColor,
                    unselectedLabelColor: AppColors.waterlooColor,
                    indicator: BoxDecoration(
                      color: AppColors.oxfordBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    tabs: [
                      Tab(child: Text(AppStrings.wantToVisit)),
                      Tab(child: Text(AppStrings.alreadyVisited)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          mocks.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: SightCard(
                                sight: mocks[mocks.length - index - 1],
                                isHaveCalendarOrShareIcon: true,
                                calendarOrShareIcon: AppAssets.calendarIcon,
                                addOrRemoveIcon: AppAssets.closeIcon,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          mocks.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: SightCard(
                                sight: mocks[index],
                                isHaveCalendarOrShareIcon: true,
                                calendarOrShareIcon: AppAssets.shareIcon,
                                addOrRemoveIcon: AppAssets.closeIcon,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
