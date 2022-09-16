import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/add_sight_screen.dart';

class AddSightScreenCategory extends StatefulWidget {
  const AddSightScreenCategory({Key? key}) : super(key: key);

  @override
  State<AddSightScreenCategory> createState() => _AddSightScreenCategoryState();
}

class _AddSightScreenCategoryState extends State<AddSightScreenCategory> {
  String category = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  AppAssets.arrowIcon,
                  color: AppColors.martiniqueColor,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 76.0,
        title: Text(
          AppStrings.category,
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            AddSightScreenCategoriesList(
              setCategory: _setCategory,
              category: category,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AddSightScreenSubmitButton(
          text: AppStrings.save,
          theme: theme,
          onPressed: () {
            _onCreateNewPlace(category);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _setCategory(String cat) {
    setState(() {
      category = cat;
    });
  }

  void _onCreateNewPlace(String category) {
    if (category.isEmpty) return;
    setState(() {
      sightCategoriesSelected.add(category);
    });
    Navigator.pop(context);
  }
}

class AddSightScreenCategoriesList extends StatefulWidget {
  final void Function(String) setCategory;
  final String category;

  const AddSightScreenCategoriesList({
    Key? key,
    required this.setCategory,
    required this.category,
  }) : super(key: key);

  @override
  State<AddSightScreenCategoriesList> createState() =>
      _AddSightScreenCategoriesListState();
}

class _AddSightScreenCategoriesListState
    extends State<AddSightScreenCategoriesList> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        sightCategories.length,
        (index) => Column(
          children: [
            InkWell(
              onTap: () {
                sightCategoriesSelected.clear();
                setState(() {
                  _selectedIndex = index;
                });
                widget.setCategory(sightCategories[index]);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sightCategories[index],
                      style: AppTypography.text16RegularMartinique,
                    ),
                    if (sightCategoriesSelected.isNotEmpty
                        ? sightCategories[index] ==
                            sightCategoriesSelected.first
                        : _selectedIndex == index)
                      SvgPicture.asset(
                        AppAssets.checkIcon,
                        width: 20.0,
                        height: 20.0,
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                height: 0.0,
                thickness: 0.8,
                color: AppColors.waterlooColor.withOpacity(0.56),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
