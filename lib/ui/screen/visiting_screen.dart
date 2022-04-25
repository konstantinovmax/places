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
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: AppColors.wildSandColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: AppColors.oxfordBlueColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: const Center(
                              child: Text(
                                AppStrings.wantToVisit,
                                style: AppTypography.text14BoldWhite,
                              ),
                            ),
                          ),
                        ),
                        const Flexible(
                          flex: 3,
                          child: Center(
                            child: Text(
                              AppStrings.alreadyVisited,
                              style: AppTypography.text14BoldWaterloo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: AppColors.wildSandColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 3,
                          child: Center(
                            child: Text(
                              AppStrings.wantToVisit,
                              style: AppTypography.text14BoldWaterloo,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: AppColors.oxfordBlueColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: const Center(
                              child: Text(
                                AppStrings.alreadyVisited,
                                style: AppTypography.text14BoldWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
