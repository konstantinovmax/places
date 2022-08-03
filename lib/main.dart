import 'package:flutter/material.dart';
import 'package:places/domain/models/switch_theme_model.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/add_sight_screen_category.dart';
import 'package:places/ui/screens/home_screen.dart';
import 'package:places/ui/screens/resources/themes.dart';
import 'package:places/ui/screens/sight_details.dart';
import 'package:places/ui/screens/sight_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final switchTheme = SwitchThemeModel();

  @override
  void initState() {
    switchTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    switchTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: switchTheme.isDarkTheme ? darkTheme : lightTheme,
      home: HomeScreen(switchTheme: switchTheme),
      initialRoute: AppRoutes.initialRoute,
      routes: {
        AppRoutes.detailsRoute: (context) => const SightDetails(),
        AppRoutes.addSightScreenRoute: (context) => const AddSightScreen(),
        AppRoutes.addSightScreenCategoryRoute: (context) =>
            const AddSightScreenCategory(),
      },
    );
  }
}
