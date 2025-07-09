import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/models/cart_item_model.dart';
import 'package:diea/models/product_model.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: kBackgroundColor,
        ),
      ),
      height: 45.0,
      elevation: 20.0,
      color: kPrimaryColor,
      padding: EdgeInsets.zero,
      minWidth: 150,
      onPressed: () {
        if (BlocProvider.of<AddProductsCubit>(context).selected == 'not') {
          showTopSnackBar(
            snackBarPosition: SnackBarPosition.bottom,
            Overlay.of(context),
            dismissType: DismissType.onSwipe,
            displayDuration: const Duration(milliseconds: 500),
            animationDuration: const Duration(milliseconds: 600),
            reverseAnimationDuration: const Duration(milliseconds: 400),
            CustomSnackBar.success(
              backgroundColor: Colors.red.withOpacity(0.4),
              icon: const Icon(Icons.done, size: 0),
              message: 'يجب اختيار حجم/ نوع',
            ),
          );
        } else {
          BlocProvider.of<AddProductsCubit>(context).addProducts(
            cartItemModel: CartItemModel(
              totalPrice: BlocProvider.of<AddProductsCubit>(context).number *
                  (BlocProvider.of<AddProductsCubit>(context).price_ == 0
                      ? productModel.price.toDouble()
                      : BlocProvider.of<AddProductsCubit>(context)
                          .price_
                          .toDouble()),
              quantity:
                  BlocProvider.of<AddProductsCubit>(context).number.toString(),
              price: BlocProvider.of<AddProductsCubit>(context).price_ == 0
                  ? productModel.price.toString()
                  : BlocProvider.of<AddProductsCubit>(context)
                      .price_
                      .toString(),
              name: productModel.name,
              size: BlocProvider.of<AddProductsCubit>(context).selected,
            ),
          );
          const Duration(seconds: 300);
          Navigator.pop(context);
          showTopSnackBar(
            Overlay.of(context),
            dismissType: DismissType.onSwipe,
            displayDuration: const Duration(milliseconds: 500),
            animationDuration: const Duration(milliseconds: 600),
            reverseAnimationDuration: const Duration(milliseconds: 400),
            const CustomSnackBar.success(
              backgroundColor: kPrimaryColor,
              icon: Icon(Icons.done, size: 0),
              message: 'تم الإضافة إلى الفاتورة بنجاح',
            ),
          );
          BlocProvider.of<AddProductsCubit>(context).selected = 'not';
        }
      },
      child: const Text('إضافة', style: TextStyle(fontSize: 22.0)),
    );
  }
}
