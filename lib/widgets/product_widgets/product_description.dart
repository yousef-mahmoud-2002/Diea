import 'package:flutter_svg/flutter_svg.dart';
import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:diea/widgets/product_widgets/product_price.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        bottom: 8,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productModel.name,
            textDirection: arabic,
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: kBackgroundColor,
                ),
                child: SvgPicture.asset(
                  'assets/icons/Cart Icon.svg',
                  colorFilter: const ColorFilter.mode(
                    kPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              ProductPrice(productModel: productModel),
            ],
          ),
        ],
      ),
    );
  }
}
