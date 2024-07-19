import 'package:flutter/material.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/helpers/helper_functions.dart';

class VoidDivider extends StatelessWidget{
  const VoidDivider({super.key, this.dividerText = ""});
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return
      dividerText != ""?
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: VoidHelperFunctions.isDarkMode(context)? VoidColors.darkGrey:VoidColors.black, thickness: 0.5, indent: 60, endIndent: 5,)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.black),),
        Flexible(child: Divider(color: VoidHelperFunctions.isDarkMode(context)? VoidColors.darkGrey:VoidColors.black, thickness: 0.5, indent: 5, endIndent: 60,)),
      ],
    ):
      Divider(color: VoidHelperFunctions.isDarkMode(context)? VoidColors.darkGrey:VoidColors.grey, thickness: 0.5);
  }
}