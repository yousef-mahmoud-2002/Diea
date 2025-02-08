import 'package:flutter/material.dart';
import 'package:diea/constants.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30.0,
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Row(
              children: [
                Expanded(child: CartTitleName(label: 'السعر')),
                VerticalDivider(width: 0, color: kPrimaryColor, thickness: 2),
                Expanded(child: CartTitleName(label: 'الكمية')),
              ],
            ),
          ),
          VerticalDivider(width: 0, color: kPrimaryColor, thickness: 2),
          Expanded(
            child: Text(
              'وصف المادة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.5,
                wordSpacing: 5.0,
              ),
            ),
          ),
          VerticalDivider(width: 0, color: kPrimaryColor, thickness: 2),
          SizedBox(
            width: 60.0,
            child: CartTitleName(label: 'المجموع'),
          ),
        ],
      ),
    );
  }
}

class CartTitleName extends StatelessWidget {
  const CartTitleName({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label, style: const TextStyle(fontSize: 13.0)),
    );
  }
}
