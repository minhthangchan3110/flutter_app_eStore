import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductRatingSection extends StatelessWidget {
  const ProductRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 5,
          direction: Axis.horizontal,
          itemSize: 12,
          itemBuilder: (_, __) => const FaIcon(
            FontAwesomeIcons.solidStar,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        Text("(4500 Reviews)",
            style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
