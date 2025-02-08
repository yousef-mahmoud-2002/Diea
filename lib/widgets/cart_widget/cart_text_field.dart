import 'package:diea/constants.dart';
import 'package:flutter/material.dart';

class CartTextField extends StatelessWidget {
  const CartTextField({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: 160.0,
          height: 20.0,
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 22.0,
            textDirection: arabic,
            cursorColor: kPrimaryColor,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.name,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Text(
          label,
          textDirection: arabic,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        ),
      ],
    );
  }
}
