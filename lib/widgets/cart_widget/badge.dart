import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diea/constants.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductsCubit, AddProductsState>(
      builder: (context, state) {
        return Center(
          child: badges.Badge(
            badgeContent: Text(
              '${BlocProvider.of<AddProductsCubit>(context).cartItems.length}',
              style: TextStyle(
                color: BlocProvider.of<AddProductsCubit>(context)
                        .cartItems
                        .isNotEmpty
                    ? Colors.white
                    : Colors.transparent,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: BlocProvider.of<AddProductsCubit>(context)
                      .cartItems
                      .isNotEmpty
                  ? kPrimaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              elevation: 2,
            ),
            position: badges.BadgePosition.topEnd(end: 6, top: -11),
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: SvgPicture.asset(
                'assets/icons/Cart Icon.svg',
                width: 32,
                colorFilter: const ColorFilter.mode(
                  kSecondaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
