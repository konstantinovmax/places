import 'package:flutter/material.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

class Textarea extends TextFormField {
  Textarea({
    Key? key,
    TextEditingController? textController,
  }) : super(
          key: key,
          controller: textController,
          minLines: 4,
          maxLines: 8,
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
          textInputAction: TextInputAction.done,
        );
}
