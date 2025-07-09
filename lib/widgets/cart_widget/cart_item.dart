import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:diea/models/cart_item_model.dart';
import 'package:diea/widgets/dialogs/delete_cart_item_dialog.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.itemModel, required this.index});

  final CartItemModel itemModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        deleteCartItemDialog(context, itemModel, index);
      },
      child: SizedBox(
        height: 28.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.0,
              child: Row(
                children: [
                  Expanded(child: ItemFieldName(label: itemModel.price)),
                  const VerticalDivider(
                      width: 0, color: kPrimaryColor, thickness: 2),
                  Expanded(child: ItemFieldName(label: itemModel.quantity)),
                ],
              ),
            ),
            const VerticalDivider(width: 0, color: kPrimaryColor, thickness: 2),
            Expanded(
              child: Text(
                maxLines: 1,
                '${itemModel.name} ${itemModel.size} ',
                textDirection: arabic,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15.0),
              ),
            ),
            const VerticalDivider(width: 0, color: kPrimaryColor, thickness: 2),
            SizedBox(
              width: 60.0,
              child: ItemFieldName(label: itemModel.totalPrice.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemFieldName extends StatelessWidget {
  const ItemFieldName({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label),
    );
  }
}
