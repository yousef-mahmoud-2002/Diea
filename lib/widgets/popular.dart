import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withValues(alpha: 0.9),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                'assets/icons/hot-icon.svg',
              ),
            ),
            const Text(
              ' الرائج',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
