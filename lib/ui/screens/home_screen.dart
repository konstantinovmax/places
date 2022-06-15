import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/models/switch_theme_model.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

class HomeScreen extends StatefulWidget {
  final SwitchThemeModel switchTheme;
  const HomeScreen({Key? key, required this.switchTheme}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const SightListScreen(),
          const VisitingScreen(),
          SettingsScreen(switchTheme: widget.switchTheme),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.waterlooColor.withOpacity(0.56),
              width: 0.8,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.25),
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (currentIndex) {
            setState(() {
              _selectedIndex = currentIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.listIcon,
                color: theme.bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.listIconActive,
                color: theme.bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.heartIcon,
                color: theme.bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.heartIconActive,
                color: theme.bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.settingsIcon,
                color: theme.bottomNavigationBarTheme.unselectedItemColor,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.settingsIconActive,
                color: theme.bottomNavigationBarTheme.selectedItemColor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
