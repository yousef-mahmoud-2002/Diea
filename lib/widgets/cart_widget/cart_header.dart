import 'package:intl/intl.dart';
import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/widgets/custom_title.dart';
import 'package:diea/widgets/cart_widget/cart_text_field.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CustomTitle(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartTextField(label: 'السيد/ السادة : '),
                  Text(
                    style: TextStyle(height: 0.1),
                    '...........................................',
                  ),
                  SizedBox(height: 12.0),
                  CartTextField(label: 'الموقع : '),
                  Text(
                    style: TextStyle(height: 0.1),
                    '...........................................',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HeaderDetails(
                      label:
                          ' التاريخ : ${DateFormat('dd - MM - yyyy').format(DateTime.now())}'),
                  HeaderDetails(
                      label:
                          ' اليوم : ${DateFormat('EEEE', 'ar').format(DateTime.now())}'),
                  HeaderDetails(
                      label:
                          ' الساعة : ${DateFormat('mm : h  a', 'ar').format(DateTime.now())}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textDirection: arabic,
      style: const TextStyle(
        fontSize: 11.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
