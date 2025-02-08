import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    late String price;
    if (productModel.price.toString().contains('.')) {
      price = productModel.price.toString();
    } else {
      price = productModel.price.toDouble().toString();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'دأ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        Text(
          price.split('.').first,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('.${price.split('.').last}'),
      ],
    );
  }
}
