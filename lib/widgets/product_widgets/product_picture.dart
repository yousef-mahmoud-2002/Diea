import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

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
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: kBackgroundColor,
          highlightColor: kPrimaryColor,
          child: Container(
            color: kBackgroundColor,
            height: 150,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
