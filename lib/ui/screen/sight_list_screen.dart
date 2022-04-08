import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screen/sight_card.dart';

// Экран для отображения списка карточек с достопримечательностями
class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          children: const [
            SizedBox(
              height: 40.0,
            ),
            Text(
              AppStrings.listOfInterestingPlaces,
              style: AppTypography.text32BoldOxfordBlue,
              maxLines: 2,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            mocks.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SightCard(
                sight: mocks[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
