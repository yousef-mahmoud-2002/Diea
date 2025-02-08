import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diea/constants.dart';
import 'package:diea/widgets/dialogs/delete_cart_dialog.dart';

class DeleteCartItem extends StatelessWidget {
  const DeleteCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: 0.0,
        minHeight: 0.0,
      ),
      onPressed: () {
        deleteCartDialog(context);
      },
      icon: SvgPicture.asset(
        'assets/icons/Trash.svg',
        height: 26,
        colorFilter: const ColorFilter.mode(
          kSecondaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
