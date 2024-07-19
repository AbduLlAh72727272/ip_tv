import 'package:flutter/cupertino.dart';
import 'package:ip_tv/app/utils/device/device.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';

class VehAttribute extends StatelessWidget {
  const VehAttribute({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: VoidColors.primary,
        ),
        const SizedBox(
          width: VoidSizes.spaceBtwItem,
        ),
        SizedBox(
          width: VoidDeviceUtils.getScreenWidth() * 0.3,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: VoidColors.black, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: VoidDeviceUtils.getScreenWidth() * 0.3,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
                color: VoidColors.darkGrey, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
