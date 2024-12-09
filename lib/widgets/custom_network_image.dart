import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double scale;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Góc bo tròn của border
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Cắt ảnh theo border
        child: Image.network(
          imageUrl,
          fit: fit,
          scale: scale,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null, // Progress indicator.
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Icon(Icons.error, color: Colors.red);
          },
        ),
      ),
    );
  }
}
