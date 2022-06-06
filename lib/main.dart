import 'package:flutter/material.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/home_screen.dart';
import 'package:places/ui/screens/resources/themes.dart';
import 'package:places/ui/screens/sight_details.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: lightTheme,
      home: const FiltersScreen(),
      initialRoute: AppRoutes.initialRoute,
      routes: {
        AppRoutes.detailsRoute: (context) => const SightDetails(),
      },
    );
  }
}
