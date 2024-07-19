import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';
import '../../utils/device/device.dart';
import '../../utils/helpers/helper_functions.dart';


class VoidSearchContainer extends StatelessWidget {
  const VoidSearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onTap, this.padding = const EdgeInsets.symmetric(horizontal: VoidSizes.defaultSpace),
  });

  final String text;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = VoidHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(padding: padding,
          child: Container(
            width: VoidDeviceUtils.getScreenWidth(),
            padding: const EdgeInsets.all(VoidSizes.md),
            decoration: BoxDecoration(
              color: showBackground? dark? VoidColors.dark : VoidColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(VoidSizes.cardRadiusLg),
              border: showBorder? Border.all(color: VoidColors.grey) : null,
            ),
            child: Row(
              children: [
                Icon(icon,color: dark? VoidColors.lightGrey : VoidColors.darkGrey),
                const SizedBox(width: VoidSizes.spaceBtwItem,),
                Text(text, style: Theme.of(context).textTheme.bodySmall!.apply(color: dark? VoidColors.lightGrey : VoidColors.darkGrey),)
              ],
            ),
          )
      ),
    );
  }
}

