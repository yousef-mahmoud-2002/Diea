import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/widgets/cart_widget/cart_item.dart';
import 'package:diea/widgets/cart_widget/cart_title.dart';
import 'package:diea/widgets/cart_widget/cart_header.dart';
import 'package:diea/widgets/cart_widget/cart_bottom.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List cartItems = BlocProvider.of<AddProductsCubit>(context).cartItems;

    return BlocBuilder<AddProductsCubit, AddProductsState>(
      builder: (context, state) {
        if (cartItems.isNotEmpty) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CartHeader(),
                const Divider(height: 1, color: kPrimaryColor, thickness: 2),
                const CartTitle(),
                const Divider(height: 1, color: kPrimaryColor, thickness: 2),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CartItem(
                      itemModel: cartItems[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                      height: 0, color: kPrimaryColor, thickness: 1),
                ),
                const Divider(height: 1, color: kPrimaryColor, thickness: 2),
                const CartBottom(),
                const Divider(height: 1, color: kPrimaryColor, thickness: 2),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('السلة فارغة'),
          );
        }
      },
    );
  }
}
