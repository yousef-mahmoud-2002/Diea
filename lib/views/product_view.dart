import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:diea/widgets/buttons/add_product_button.dart';
import 'package:diea/widgets/product_widgets/product_counter.dart';
import 'package:diea/widgets/product_widgets/product_picture.dart';
import 'package:diea/widgets/listviews/product_size_listview.dart';
import 'package:diea/widgets/product_widgets/product_view_desc.dart';
import 'package:diea/widgets/product_widgets/zoom_product_picture.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              width: double.infinity,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ZoomProductPicture(
                        image: productModel.image,
                      );
                    },
                  ),
                ),
                child: ProductPicture(
                  image: productModel.image,
                  radius: 16.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    productModel.name,
                    textDirection: arabic,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  ProductViewDesc(desc: productModel.desc ?? ''),
                  const SizedBox(height: 12.0),
                  const Divider(height: 0, color: kPrimaryColor),
                  ProductSizeListView(size: productModel.size ?? []),
                  const Divider(height: 0, color: kPrimaryColor),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: kBackgroundColor,
                          ),
                        ),
                        child: const ProductCounter(),
                      ),
                      const SizedBox(width: 8.0),
                      AddProductButton(productModel: productModel),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
