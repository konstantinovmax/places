import 'package:flutter/material.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/add_sight_screen_category.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/sight_search_screen.dart';

class SightListScreenTab extends StatefulWidget {
  const SightListScreenTab({Key? key}) : super(key: key);

  @override
  State<SightListScreenTab> createState() => _SightListScreenTabState();
}

class _SightListScreenTabState extends State<SightListScreenTab> {
  BuildContext? _navigationContext;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        late Widget pageName;

        switch (settings.name) {
          case AppRoutes.initialRoute:
            pageName = const SightListScreen();
            break;
          case AppRoutes.sightSearchScreenRoute:
            pageName = const SightSearchScreen();
            break;
          case AppRoutes.detailsRoute:
            pageName = const SightDetails();
            break;
          case AppRoutes.addSightScreenRoute:
            pageName = const AddSightScreen();
            break;
          case AppRoutes.addSightScreenCategoryRoute:
            pageName = const AddSightScreenCategory();
            break;
          default:
            pageName = const SightListScreen();
            break;
        }

        return MaterialPageRoute<Widget>(
          builder: (context) {
            _navigationContext ??= context;

            return pageName;
          },
          settings: settings,
        );
      },
    );
  }
}
