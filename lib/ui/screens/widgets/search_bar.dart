import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isTextControllerNotEmpty;
  final Function()? clearTextController;
  final TextEditingController textController;

  const SearchBar({
    Key? key,
    required this.onChanged,
    required this.isTextControllerNotEmpty,
    required this.clearTextController,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SvgPicture.asset(AppAssets.searchIcon),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 24.0,
            minHeight: 24.0,
          ),
          suffixIcon: isTextControllerNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: clearTextController,
                    icon: SvgPicture.asset(AppAssets.inputDeleteIcon),
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 24.0,
            minHeight: 24.0,
          ),
          filled: true,
          fillColor: AppColors.wildSandColor,
          hintText: AppStrings.search,
          hintStyle: AppTypography.text16RegularWaterloo,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
        style: AppTypography.text16RegularMartinique,
        textInputAction: TextInputAction.next,
        controller: textController,
      ),
    );
  }
}
