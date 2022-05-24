import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          SightListScreen(),
          VisitingScreen(),
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
                color: AppColors.oxfordBlueColor,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.listIconActive,
                color: AppColors.oxfordBlueColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.heartIcon,
                color: AppColors.oxfordBlueColor,
              ),
              activeIcon: SvgPicture.asset(
                AppAssets.heartIconActive,
                color: AppColors.oxfordBlueColor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
