import 'package:flutter/material.dart';
import 'package:diea/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: kPrimaryColor,
      height: 48,
      color: kBackgroundColor,
      onPressed: () {
        launchUrl(Uri.parse("whatsapp://send?phone=962782534529"));
      },
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
