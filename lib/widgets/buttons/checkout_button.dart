import 'package:flutter/material.dart';
import 'package:diea/constants.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: kPrimaryColor,
      height: 48,
      color: kBackgroundColor,
      onPressed: onPressed,
      child: const Text(
        'Checkout',
        style: TextStyle(
          fontSize: 20,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
