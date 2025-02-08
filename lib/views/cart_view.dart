import 'package:flutter/material.dart';
import 'package:diea/constants.dart';
import 'package:diea/widgets/buttons/checkout_button.dart';
import 'package:diea/widgets/cart_widget/delete_cart.dart';
import 'package:diea/widgets/listviews/cart_items_listview.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutButton(),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        foregroundColor: kPrimaryColor,
        backgroundColor: Colors.white,
        title: const Text(
          'الفاتورة',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            color: kSecondaryColor,
            Icons.arrow_back,
            size: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: DeleteCartItem(),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(height: 1, color: kPrimaryColor, thickness: 0.7),
        ),
      ),
      body: const CartItemsListView(),
    );
  }
}
