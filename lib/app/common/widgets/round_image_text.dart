import 'package:flutter/material.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';
import '../../utils/helpers/helper_functions.dart';


class VoidVerticalRoundImageText extends StatelessWidget {
  const VoidVerticalRoundImageText({
    super.key, required this.image, required this.title, required this.textColor, this.backgroundColor, this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = VoidHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: VoidSizes.spaceBtwItem),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(VoidSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark? VoidColors.black: VoidColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark? VoidColors.light : VoidColors.dark,),
              ),
            ),
            const SizedBox(height: VoidSizes.spaceBtwItem/2,),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(title, style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
