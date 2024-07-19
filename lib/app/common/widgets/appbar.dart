import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';
import '../../utils/device/device.dart';
import '../../utils/helpers/helper_functions.dart';

class VoidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VoidAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VoidSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: VoidHelperFunctions.isDarkMode(context)
                      ? VoidColors.white
                      : VoidColors.black,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(
                      leadingIcon,
                      color: VoidHelperFunctions.isDarkMode(context)
                          ? VoidColors.white
                          : VoidColors.black,
                    ))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(VoidDeviceUtils.getAppBarHeight());
}
