import 'package:flutter/material.dart';
import '../../utils/constraints/colors.dart';
import '../../utils/device/device.dart';
import '../../utils/helpers/helper_functions.dart';

class VoidTabBar extends StatelessWidget implements PreferredSizeWidget {
  const VoidTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {

    return Material(
      color: VoidHelperFunctions.isDarkMode(context)?VoidColors.black:VoidColors.white,
      child: SizedBox(
        child: TabBar(
          isScrollable: false,//true,
          indicatorColor: VoidColors.primary,
          unselectedLabelColor: VoidColors.darkGrey,
          labelColor: VoidHelperFunctions.isDarkMode(context)?VoidColors.white:VoidColors.primary,
          tabs: tabs,
        ),
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(VoidDeviceUtils.getAppBarHeight());
}
