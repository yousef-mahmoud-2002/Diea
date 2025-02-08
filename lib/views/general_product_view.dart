import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diea/widgets/product_widgets/product.dart';

class GetGeneralCategoryView extends StatelessWidget {
  const GetGeneralCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference category =
        FirebaseFirestore.instance.collection('general');
    return FutureBuilder<QuerySnapshot>(
      future: category.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            products.add(ProductModel.fromJson(snapshot.data!.docs[i]));
          }
          return MasonryGridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            crossAxisCount: 2,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Product(productModel: products[index]);
            },
          );
        } else {
          return const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
