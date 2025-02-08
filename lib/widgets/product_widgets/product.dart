import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:diea/views/product_view.dart';
import 'package:diea/widgets/product_widgets/product_picture.dart';
import 'package:diea/widgets/product_widgets/product_description.dart';

class Product extends StatelessWidget {
  const Product({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => ProductView(productModel: productModel),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
        );
      },
      child: Card(
        elevation: 3.0,
        shadowColor: Colors.blueGrey,
        margin: const EdgeInsets.all(2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductPicture(image: productModel.image, radius: 8.0),
            ),
            ProductDescription(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
