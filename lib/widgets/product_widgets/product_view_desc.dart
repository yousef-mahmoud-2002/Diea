import 'package:flutter/material.dart';
import 'package:diea/constants.dart';

class ProductViewDesc extends StatelessWidget {
  const ProductViewDesc({super.key, required this.desc});

  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16),
        const Text(
          ': الوصف',
        ),
        Text(
          desc,
          textDirection: arabic,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
