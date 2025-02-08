import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/models/cart_item_model.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

Future<dynamic> deleteCartItemDialog(context, CartItemModel item, index) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kBackgroundColor,
          actionsPadding:
              const EdgeInsets.only(bottom: 30.0, left: 40.0, right: 40.0),
          insetPadding: const EdgeInsets.only(top: 440.0),
          titlePadding:
              const EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          title: const Text(
            'هل أنت متأكد من حذف العنصر ؟',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0),
          ),
          content: Text(
            item.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 20.0,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('لا', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 20.0,
                    color: kPrimaryColor,
                    onPressed: () {
                      BlocProvider.of<AddProductsCubit>(context)
                          .deleteCartProduct(index, item.totalPrice);
                      Navigator.pop(context);
                      showTopSnackBar(
                        dismissType: DismissType.onSwipe,
                        reverseAnimationDuration:
                            const Duration(milliseconds: 400),
                        displayDuration: const Duration(milliseconds: 500),
                        animationDuration: const Duration(milliseconds: 600),
                        Overlay.of(context),
                        CustomSnackBar.success(
                          backgroundColor: kPrimaryColor,
                          icon: const Icon(Icons.done, size: 0),
                          message: 'تم حذف ' '${item.name}' ' بنجاح',
                        ),
                      );
                    },
                    child: const Text('نعم', style: TextStyle(fontSize: 24.0)),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
