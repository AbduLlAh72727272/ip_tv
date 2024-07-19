import 'package:flutter/material.dart';

import '../../utils/constraints/colors.dart';
import '../widgets/curved_edges_widget.dart';
import 'circular_container.dart';

class VoidPrimaryHeaderContainer extends StatelessWidget {
  const VoidPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VoidCurvedEdgeWidget(
      child: Container(
        color: VoidColors.primary,
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: VoidCircularContainer(backgroundColor: VoidColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300, child: VoidCircularContainer(backgroundColor: VoidColors.textWhite.withOpacity(0.1),)),
            child,
            //if (child != null) Positioned.fill(child: child!),
          ],
        ),
      ),
    );
  }
}
