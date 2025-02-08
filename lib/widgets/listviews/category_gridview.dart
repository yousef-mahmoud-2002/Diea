import 'package:flutter_svg/svg.dart';
import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/product_model.dart';
import 'package:diea/widgets/product_widgets/product.dart';
import 'package:diea/widgets/buttons/cart_view_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.products,
    required this.categoryName,
  });

  final List<ProductModel> products;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: true,
            title: Text(categoryName),
            backgroundColor: Colors.transparent,
            actions: const [CartViewButton()],
            foregroundColor: kPrimaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                width: 26,
                colorFilter: const ColorFilter.mode(
                  kSecondaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 1),
              child: Divider(height: 1, color: kPrimaryColor, thickness: 0.7),
            ),
          ),
        ],
        body: MasonryGridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          crossAxisCount: 2,
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Product(productModel: products[index]);
          },
        ),
      ),
    );
  }
}
