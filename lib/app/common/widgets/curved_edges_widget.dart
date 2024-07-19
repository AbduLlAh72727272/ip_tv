import 'package:flutter/material.dart';
import 'curved_edges.dart';


class VoidCurvedEdgeWidget extends StatelessWidget {

  final Widget? child;

  const VoidCurvedEdgeWidget({
    super.key, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VoidCustomCurvedEdges(),
      child: child,
    );
  }
}
