import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diea/widgets/product_widgets/product.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetGeneralCategoryView extends StatefulWidget {
  const GetGeneralCategoryView({super.key});

  @override
  State<GetGeneralCategoryView> createState() => _GetGeneralCategoryViewState();
}

class _GetGeneralCategoryViewState extends State<GetGeneralCategoryView> {
  late CollectionReference<Map<String, dynamic>> category;
  List<ProductModel> products = [];
  bool showSkeleton = true;

  @override
  void initState() {
    category = FirebaseFirestore.instance.collection('general');
    super.initState();
  }

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
          child: MasonryGridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            crossAxisCount: 2,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Product(productModel: products[index]);
            },
          ),
        );
      },
    );
  }
}
