import 'package:diea/constants.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartTextField extends StatelessWidget {
  const CartTextField({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(
          width: 160.0,
          height: 20.0,
          child: TextFormField(
            controller: TextEditingController(
              text: label == 'السيد/ السادة : '
                  ? context.read<AddProductsCubit>().customerName
                  : context.read<AddProductsCubit>().areaName,
            ),
            onChanged: (value) {
              if (label == 'السيد/ السادة : ') {
                context.read<AddProductsCubit>().customerName = value;
              } else {
                context.read<AddProductsCubit>().areaName = value;
              }
            },
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 22.0,
            textDirection: arabic,
            cursorColor: kPrimaryColor,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.name,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Text(
          label,
          textDirection: arabic,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        ),
      ],
    );
  }
}
