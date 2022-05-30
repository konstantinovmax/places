import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/sight_card.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.favorites,
            style: theme.textTheme.headline6,
          ),
          centerTitle: true,
          elevation: 0.0,
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: TabBar(
                    labelColor: theme.hintColor,
                    unselectedLabelColor: theme.disabledColor,
                    indicator: BoxDecoration(
                      color: theme.indicatorColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                    ),
                    tabs: const [
                      Tab(
                        child: Text(
                          AppStrings.wantToVisit,
                          style: AppTypography.text14Bold,
                        ),
                      ),
                      Tab(
                        child: Text(
                          AppStrings.alreadyVisited,
                          style: AppTypography.text14Bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(40.0),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
              child: Column(
                children: List.generate(
                  mocks.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
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
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
              child: Column(
                children: List.generate(
                  mocks.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
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
    );
  }
}
