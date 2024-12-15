import 'package:admin_ecommerce/screens/product_list_screen/curved_edgets.dart/custom_curved_edges.dart';
import 'package:flutter/material.dart';

class CustomCurvedEdgetsWidget extends StatelessWidget {
  const CustomCurvedEdgetsWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
