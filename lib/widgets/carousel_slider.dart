import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utility/app_color.dart';
import '../models/product.dart';
import '../utility/utility_extention.dart';
import 'custom_network_image.dart';

// CarouselSlider
class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    super.key,
    required this.items,
  });

  final List<Images> items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.32,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              var imageUrl = widget.items.safeElementAt(index)?.url ?? '';
              // Log đường dẫn ảnh tại đây
              if (imageUrl.contains('localhost')) {
                imageUrl = imageUrl.replaceFirst('localhost', '10.0.2.2');
              }

              return FittedBox(
                fit: BoxFit.none,
                child: CustomNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  scale: 3.0,
                ),
              );
            },
          ),
        ),
        AnimatedSmoothIndicator(
          effect: const WormEffect(
            dotHeight: 8, // Chiều cao của dot
            dotWidth: 8, // Chiều rộng của dot
            spacing: 8, // Khoảng cách giữa các dot
            dotColor: Colors.grey, // Màu của dot không được chọn
            activeDotColor: Colors.black, // Màu của dot đang được chọn
          ),
          count: widget.items.length,
          activeIndex: newIndex,
        )
      ],
    );
  }
}
