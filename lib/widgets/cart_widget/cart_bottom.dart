import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/constants.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductsCubit, AddProductsState>(
      builder: (context, state) {
        return SizedBox(
          height: 30.0,
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'المجموع الكلي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    wordSpacing: 5.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const VerticalDivider(
                  width: 0, color: kPrimaryColor, thickness: 2),
              SizedBox(
                width: 60.0,
                child: Center(
                  child: Text(
                    '${BlocProvider.of<AddProductsCubit>(context).total}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
