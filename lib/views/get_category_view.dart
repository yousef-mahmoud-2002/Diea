import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diea/widgets/listviews/category_gridview.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        if (snapshot.hasError) {
          return Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text('Enable to fetch Products'),
            ),
          );
        }

        List<ProductModel> products = [];
        bool showSkeleton = true;

        if (snapshot.connectionState == ConnectionState.waiting) {
          products = List.generate(12, (index) => ProductModel.dummy());
        } else if (snapshot.hasData) {
          products = snapshot.data!.docs
              .map((product) => ProductModel.fromJson(product))
              .toList();
          showSkeleton = false;
        }
        return Skeletonizer(
          enabled: showSkeleton,
          child: CategoryGridView(
            products: products,
            categoryName: categoryTitle,
          ),
        );
      },
    );
  }
}
