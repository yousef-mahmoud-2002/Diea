import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/models/cart_item_model.dart';

part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit() : super(AddProductsCubitInitial());

  TextEditingController controller = TextEditingController();
  List<CartItemModel> cartItems = [];
  double total = 0;
  int number = 1;
  String selected = 'not';
  num price_ = 0;

  addProducts({required CartItemModel cartItemModel}) {
    total += cartItemModel.totalPrice;
    cartItems.add(cartItemModel);
    emit(AddProduct());
  }

  deleteCart() {
    cartItems.clear();
    total = 0;
    emit(DeleteCart());
  }

  deleteCartProduct(index, double price) {
    cartItems.removeAt(index);
    total = total - price;
    emit(DeleteProduct());
  }
}
