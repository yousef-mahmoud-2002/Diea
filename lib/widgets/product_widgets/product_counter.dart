import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diea/constants.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  void initState() {
    BlocProvider.of<AddProductsCubit>(context).number = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            color: kBackgroundColor,
          ),
          child: IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            splashColor: kBackgroundColor,
            constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
            onPressed: () {
              if (BlocProvider.of<AddProductsCubit>(context).number >= 2) {
                setState(() {
                  BlocProvider.of<AddProductsCubit>(context).number--;
                });
              }
            },
            icon: const FaIcon(
              FontAwesomeIcons.minus,
              color: kPrimaryColor,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            '${BlocProvider.of<AddProductsCubit>(context).number}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
              fontSize: 18,
              height: 0.9,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            color: kBackgroundColor,
          ),
          child: IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            splashColor: kBackgroundColor,
            constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
            onPressed: () {
              setState(() {
                BlocProvider.of<AddProductsCubit>(context).number++;
              });
            },
            icon: const FaIcon(
              FontAwesomeIcons.plus,
              color: kPrimaryColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
