import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
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
          currentIndex: tabController.index,
          onTap: (currentIndex) {
            tabController.animateTo(currentIndex);
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
