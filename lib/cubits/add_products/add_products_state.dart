part of 'add_products_cubit.dart';

@immutable
sealed class AddProductsState {}

final class AddProductsCubitInitial extends AddProductsState {}

class AddProduct extends AddProductsState {}

class DeleteProduct extends AddProductsState {}

class DeleteCart extends AddProductsState {}
