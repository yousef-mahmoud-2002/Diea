import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductPicture extends StatelessWidget {
  const ProductPicture({
    super.key,
    required this.image,
    required this.radius,
  });

  final String image;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            strokeWidth: 0.7,
            color: kBackgroundColor,
          ),
        ),
      ),
    );
  }
}
