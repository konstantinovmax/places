// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:places/theme/app_assets.dart';
// import 'package:places/theme/app_colors.dart';
// import 'package:places/theme/app_routes.dart';
// import 'package:places/theme/app_strings.dart';
// import 'package:places/theme/app_typography.dart';
// import 'package:places/ui/screens/filters_screen.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.0,
//       child: TextField(
//         autofocus: true,
//         onTap: () {
//           Navigator.pushNamed(context, AppRoutes.sightSearchScreenRoute);
//         },
//         readOnly: true,
//         decoration: InputDecoration(
//           prefixIcon: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: SvgPicture.asset(AppAssets.searchIcon),
//           ),
//           prefixIconConstraints: const BoxConstraints(
//             minWidth: 24.0,
//             minHeight: 24.0,
//           ),
//           suffixIcon: Padding(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               constraints: const BoxConstraints(),
//               onPressed: () async {
//                 await showDialog<Widget>(
//                   context: context,
//                   builder: (c) {
//                     return StatefulBuilder(
//                       builder: (context, setState) {
//                         return const FiltersScreen();
//                       },
//                     );
//                   },
//                 );
//               },
//               icon: SvgPicture.asset(AppAssets.filterIcon),
//             ),
//           ),
//           suffixIconConstraints: const BoxConstraints(
//             minWidth: 24.0,
//             minHeight: 24.0,
//           ),
//           filled: true,
//           fillColor: AppColors.wildSandColor,
//           hintText: AppStrings.search,
//           hintStyle: AppTypography.text16RegularWaterloo,
//           enabledBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           disabledBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
//         ),
//         style: AppTypography.text16RegularMartinique,
//         textInputAction: TextInputAction.next,
//       ),
//     );
//   }
// }
