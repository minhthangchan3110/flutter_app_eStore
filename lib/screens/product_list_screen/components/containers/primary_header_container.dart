import 'package:admin_ecommerce/screens/product_list_screen/components/containers/circular_container.dart';
import 'package:admin_ecommerce/screens/product_list_screen/curved_edgets.dart/custom_curved_edgets_widget.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgetsWidget(
      child: Container(
        color: Color(0xFF4b68ff),
        padding: const EdgeInsets.all(0),
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(
                  backgroundColor: Color(0xFFFFFFFF).withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(
                  backgroundColor: Color(0xFFFFFFFF).withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
