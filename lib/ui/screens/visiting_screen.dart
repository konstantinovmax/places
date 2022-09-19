import 'package:flutter/material.dart';
import 'package:places/domain/models/sight_model.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/sight_card.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  List<SightModel> wantToVisitPlaces = [];
  List<SightModel> alreadyVisitedPlaces = [];

  @override
  void initState() {
    wantToVisitPlaces.addAll(mocks);
    alreadyVisitedPlaces.addAll(mocks);
    super.initState();
  }

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
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: ReorderableListView.builder(
                padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
                itemCount: wantToVisitPlaces.length,
                itemBuilder: (context, index) => Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: SightCard(
                      sight: wantToVisitPlaces[index],
                      isHaveCalendarOrShareIcon: true,
                      calendarOrShareIcon: AppAssets.calendarIcon,
                      addOrRemoveIcon: AppAssets.closeIcon,
                      onDeletePlace: () {
                        _onDeletePlace(
                          index,
                          wantToVisitPlaces,
                        );
                      },
                    ),
                  ),
                ),
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

                    final place = wantToVisitPlaces.removeAt(oldIndex);
                    wantToVisitPlaces.insert(index, place);
                  });
                },
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: ReorderableListView.builder(
                padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
                itemCount: alreadyVisitedPlaces.length,
                itemBuilder: (context, index) => Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: SightCard(
                      sight: alreadyVisitedPlaces[index],
                      isHaveCalendarOrShareIcon: true,
                      calendarOrShareIcon: AppAssets.shareIcon,
                      addOrRemoveIcon: AppAssets.closeIcon,
                      onDeletePlace: () {
                        _onDeletePlace(index, alreadyVisitedPlaces);
                      },
                    ),
                  ),
                ),
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

                    final place = alreadyVisitedPlaces.removeAt(oldIndex);
                    alreadyVisitedPlaces.insert(index, place);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDeletePlace(int index, List<SightModel> places) {
    setState(() {
      places.removeAt(index);
    });
  }
}
