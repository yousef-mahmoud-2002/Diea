import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diea/widgets/listviews/category_gridview.dart';

class GetCategoryView extends StatelessWidget {
  const GetCategoryView({
    super.key,
    required this.category,
    required this.categoryTitle,
  });

  final CollectionReference category;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: category.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            products.add(ProductModel.fromJson(snapshot.data!.docs[i]));
          }
          return CategoryGridView(
            products: products,
            categoryName: categoryTitle,
          );
        } else {
          return Container(
            color: kBackgroundColor,
            child: const Center(
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
