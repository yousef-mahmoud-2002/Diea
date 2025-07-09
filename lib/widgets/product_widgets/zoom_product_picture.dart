import 'package:flutter/material.dart';

import 'product_picture.dart';

class ZoomProductPicture extends StatelessWidget {
  const ZoomProductPicture({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('back to product'),
        backgroundColor: Colors.black,
        toolbarHeight: 40,
      ),
      backgroundColor: Colors.black,
      body: InteractiveViewer(
        child: Center(
          child: ProductPicture(image: image, radius: 0),
        ),
      ),
    );
  }
}
