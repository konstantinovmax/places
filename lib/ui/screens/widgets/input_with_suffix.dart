import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_typography.dart';

class InputWithSuffix extends StatefulWidget {
  final TextInputType textInputType;
  final TextEditingController textController;

  const InputWithSuffix({
    Key? key,
    required this.textInputType,
    required this.textController,
  }) : super(key: key);

  @override
  State<InputWithSuffix> createState() => _InputWithSuffixState();
}

class _InputWithSuffixState extends State<InputWithSuffix> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: widget.textController,
        onChanged: (_) {
          setState(() {
            widget.textController.text;
          });
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          suffixIcon: widget.textController.text.isNotEmpty
              ? IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      widget.textController.clear();
                    });
                  },
                  icon: SvgPicture.asset(AppAssets.inputDeleteIcon),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36.0,
            minWidth: 36.0,
          ),
        ),
        minLines: 1,
        keyboardType: widget.textInputType,
        style: AppTypography.text16RegularMartinique,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
