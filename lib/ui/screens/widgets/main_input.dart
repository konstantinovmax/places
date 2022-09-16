import 'package:flutter/material.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

class MainInput extends StatelessWidget {
  final TextEditingController? textController;
  const MainInput({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          hintText: AppStrings.enterTheText.toLowerCase(),
          hintStyle: AppTypography.text16RegularWaterloo,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppColors.fruitSaladColor.withOpacity(0.4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              width: 2.0,
              color: AppColors.fruitSaladColor.withOpacity(0.4),
            ),
          ),
          contentPadding: const EdgeInsets.all(10.0),
        ),
        style: AppTypography.text16RegularMartinique,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
