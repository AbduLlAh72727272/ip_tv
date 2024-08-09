// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../utils/constraints/colors.dart';
// import '../../utils/helpers/helper_functions.dart';
//
//
// class VoidTabBar extends StatelessWidget implements PreferredSizeWidget {
//   const VoidTabBar({super.key, required this.tabs});
//
//   final List<Widget> tabs;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Material(
//       color: VoidHelperFunctions.isDarkMode(context)?VoidColors.blackColor:VoidColors.whiteColor,
//       child: SizedBox(
//         child: TabBar(
//           isScrollable: false,//true,
//           indicatorColor: VoidColors.primary,
//           unselectedLabelColor: VoidColors.greyColor,
//           labelColor: VoidHelperFunctions.isDarkMode(context)?VoidColors.whiteColor:VoidColors.primary,
//           tabs: tabs,
//         ),
//       )
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(100.h);
// }
