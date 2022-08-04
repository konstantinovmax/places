import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/models/sight_model.dart';
import 'package:places/mocks.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';
import 'package:places/ui/screens/add_sight_screen_category.dart';
import 'package:places/ui/screens/widgets/input_with_suffix.dart';
import 'package:places/ui/screens/widgets/main_input.dart';
import 'package:places/ui/screens/widgets/textarea.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  State<AddSightScreen> createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController latitudeInputController = TextEditingController();
  final TextEditingController longitudeInputController =
      TextEditingController();
  final TextEditingController descriptionInputController =
      TextEditingController();
  bool isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  sightCategoriesSelected.clear();
                },
                child: const Text(
                  AppStrings.cancel,
                  style: AppTypography.text16MediumWaterloo,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 76.0,
        title: Text(
          AppStrings.newPlace,
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          onChanged: _checkButtonStatus,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              const AddSightScreenCategoryInput(),
              const SizedBox(height: 24.0),
              AddSightScreenNameInput(nameInputController: nameInputController),
              const SizedBox(height: 24.0),
              AddSightScreenCoordinatesInput(
                latitudeInputController: latitudeInputController,
                longitudeInputController: longitudeInputController,
              ),
              const SizedBox(height: 37.0),
              AddSightScreenDescriptionInput(
                descriptionInputController: descriptionInputController,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AddSightScreenSubmitButton(
          text: AppStrings.create,
          theme: theme,
          onPressed: isButtonDisabled
              ? null
              : () {
                  mocks.add(
                    SightModel(
                      name: nameInputController.text,
                      lat: double.parse(latitudeInputController.text),
                      lon: double.parse(longitudeInputController.text),
                      url:
                          'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                      details: descriptionInputController.text,
                      type: sightCategoriesSelected.first,
                    ),
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.initialRoute,
                    (route) => false,
                  );
                  sightCategoriesSelected.clear();
                },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _checkButtonStatus() {
    if (sightCategoriesSelected.isNotEmpty &&
        nameInputController.text.length > 2 &&
        latitudeInputController.text.isNotEmpty &&
        longitudeInputController.text.isNotEmpty &&
        descriptionInputController.text.length > 7) {
      setState(() {
        isButtonDisabled = false;
      });
    } else {
      setState(() {
        isButtonDisabled = true;
      });
    }
  }
}

class AddSightScreenCategoryInput extends StatefulWidget {
  const AddSightScreenCategoryInput({Key? key}) : super(key: key);

  @override
  State<AddSightScreenCategoryInput> createState() =>
      _AddSightScreenCategoryInputState();
}

class _AddSightScreenCategoryInputState
    extends State<AddSightScreenCategoryInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                AppStrings.category.toUpperCase(),
                style: AppTypography.text12RegularWaterloo,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            await showDialog<Widget>(
              context: context,
              builder: (c) {
                return StatefulBuilder(builder: (context, setState) {
                  return const AddSightScreenCategory();
                });
              },
            );
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sightCategoriesSelected.isEmpty
                      ? AppStrings.notSelected
                      : sightCategoriesSelected.first,
                  style: AppTypography.text16RegularWaterloo,
                ),
                RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    AppAssets.arrowIcon,
                    color: AppColors.martiniqueColor,
                  ),
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
    );
  }
}

class AddSightScreenNameInput extends StatelessWidget {
  final TextEditingController nameInputController;

  const AddSightScreenNameInput({
    Key? key,
    required this.nameInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.name.toUpperCase(),
                style: AppTypography.text12RegularWaterloo,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          MainInput(textController: nameInputController),
        ],
      ),
    );
  }
}

class AddSightScreenCoordinatesInput extends StatelessWidget {
  final TextEditingController latitudeInputController;
  final TextEditingController longitudeInputController;

  const AddSightScreenCoordinatesInput({
    Key? key,
    required this.latitudeInputController,
    required this.longitudeInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.latitude.toUpperCase(),
                      style: AppTypography.text12RegularWaterloo,
                    ),
                    const SizedBox(height: 12.0),
                    InputWithSuffix(
                      textController: latitudeInputController,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.longitude.toUpperCase(),
                      style: AppTypography.text12RegularWaterloo,
                    ),
                    const SizedBox(height: 12.0),
                    InputWithSuffix(
                      textController: longitudeInputController,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: const [
              Text(
                AppStrings.pointOnTheMap,
                style: AppTypography.text16MediumFruitSalad,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddSightScreenDescriptionInput extends StatelessWidget {
  final TextEditingController descriptionInputController;

  const AddSightScreenDescriptionInput({
    Key? key,
    required this.descriptionInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                AppStrings.description.toUpperCase(),
                style: AppTypography.text12RegularWaterloo,
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Textarea(
            textController: descriptionInputController,
          ),
        ],
      ),
    );
  }
}

class AddSightScreenSubmitButton extends StatelessWidget {
  final ThemeData theme;
  final String text;
  final void Function()? onPressed;

  const AddSightScreenSubmitButton({
    Key? key,
    required this.text,
    required this.theme,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: onPressed != null
              ? MaterialStateProperty.resolveWith(
                  (states) => theme.canvasColor,
                )
              : null,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.toUpperCase(),
              style: onPressed != null
                  ? theme.textTheme.subtitle1
                  : theme.textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
