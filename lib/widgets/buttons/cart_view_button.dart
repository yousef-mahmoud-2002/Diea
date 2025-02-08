import 'package:flutter/material.dart';
import 'package:diea/views/cart_view.dart';
import 'package:diea/widgets/cart_widget/badge.dart';

class CartViewButton extends StatelessWidget {
  const CartViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartView();
            },
          ),
        );
      },
      icon: const CartBadge(),
    );
  }
}
