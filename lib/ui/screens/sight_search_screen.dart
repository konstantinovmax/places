import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/models/sight_model.dart';
import 'package:places/theme/app_assets.dart';
import 'package:places/theme/app_colors.dart';
import 'package:places/theme/app_routes.dart';
import 'package:places/theme/app_strings.dart';
import 'package:places/theme/app_typography.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  State<SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController textController = TextEditingController();
  final List<SightModel> places = [];
  final List<String> requestHistory = [];

  Timer? timer;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final args = ModalRoute.of(context)!.settings.arguments as List<SightModel>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.listOfInterestingPlaces,
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 40.0,
              child: TextField(
                autofocus: true,
                onChanged: (_) {
                  isLoading = true;

                  if (timer != null) {
                    setState(() {
                      timer?.cancel();
                    });
                  }
                  timer = Timer(const Duration(seconds: 1), () {
                    requestHistory.add(textController.text);
                    isLoading = false;

                    if (textController.text.isNotEmpty) {
                      final searchingItems = <SightModel>[];

                      for (final item in args) {
                        if (item.name
                            .toLowerCase()
                            .contains(textController.text.toLowerCase())) {
                          searchingItems.add(item);
                        }
                      }

                      setState(() {
                        places
                          ..clear()
                          ..addAll(searchingItems);
                      });
                    } else {
                      setState(places.clear);
                    }
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SvgPicture.asset(AppAssets.searchIcon),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 24.0,
                    minHeight: 24.0,
                  ),
                  suffixIcon: textController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              setState(() {
                                textController.clear();
                                places.clear();
                              });
                            },
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
            ),
          ),
          preferredSize: const Size.fromHeight(40.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  color: AppColors.waterlooColor,
                  backgroundColor: AppColors.waterlooColor.withOpacity(0.1),
                ),
              )
            : Column(
                children: List.generate(
                  places.length,
                  (index) {
                    final startIndex = places[index]
                        .name
                        .toLowerCase()
                        .indexOf(textController.text);

                    return Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16.0,
                                0.0,
                                16.0,
                                0.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 56.0,
                                    height: 56.0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        places[index].url,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        loadingBuilder:
                                            (context, widget, loadingProgress) {
                                          if (loadingProgress != null) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          return widget;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: places[index]
                                              .name
                                              .substring(0, startIndex),
                                          style: AppTypography
                                              .text16RegularMartinique,
                                          children: [
                                            TextSpan(
                                              text:
                                                  places[index].name.substring(
                                                        startIndex,
                                                        startIndex +
                                                            textController
                                                                .text.length,
                                                      ),
                                              style: AppTypography
                                                  .text16BoldMartinique,
                                            ),
                                            TextSpan(
                                              text:
                                                  places[index].name.substring(
                                                        startIndex +
                                                            textController
                                                                .text.length,
                                                      ),
                                              style: AppTypography
                                                  .text16RegularMartinique,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        places[index].type,
                                        style:
                                            AppTypography.text14RegularWaterloo,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.detailsRoute,
                                      arguments: places[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22.0),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
