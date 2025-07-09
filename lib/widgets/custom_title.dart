import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لمواد البناء',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 6.0),
        Text(
          'الضياء',
          style: TextStyle(
            fontSize: 22.0,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
