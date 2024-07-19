import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ip_tv/app/common/widgets/shimmer_effect.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/constraints/sizes.dart';

class VoidCircularImage extends StatelessWidget {
  const VoidCircularImage({
    super.key,
    this.width = 55,
    this.height = 55,
    required this.imageUrl,
    this.backgroundColor,
    this.boxFit = BoxFit.fill,
    this.padding = VoidSizes.xs,
    this.isNetworkImage = false,
    this.overlayColor,
  });

  final double width, height, padding;
  final String imageUrl;
  final Color? backgroundColor, overlayColor;
  final BoxFit? boxFit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor ?? VoidColors.grey,
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: boxFit,
                    color: overlayColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const VoidShimmerEffect(
                      width: 55,
                      height: 55,
                      radius: 55,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: boxFit,
                    image: AssetImage(imageUrl),
                    color: overlayColor,
                  ),
          ),
        ));
  }
}
