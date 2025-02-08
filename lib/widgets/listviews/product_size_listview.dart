import 'package:diea/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diea/cubits/add_products/add_products_cubit.dart';

class ProductSizeListView extends StatefulWidget {
  const ProductSizeListView({super.key, required this.size});

  final List<dynamic> size;

  @override
  State<ProductSizeListView> createState() => _ProductSizeListViewState();
}

class _ProductSizeListViewState extends State<ProductSizeListView> {
  int selected = -1;

  @override
  void initState() {
    if (widget.size.isEmpty) {
      BlocProvider.of<AddProductsCubit>(context).selected = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.isEmpty ? 0 : 72,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.separated(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.size.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selected = index;
                BlocProvider.of<AddProductsCubit>(context).selected =
                    widget.size[index]['size'];
                BlocProvider.of<AddProductsCubit>(context).price_ =
                    widget.size[index]['price'];
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeIn,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border:
                    selected == index ? Border.all(color: kPrimaryColor) : null,
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
              duration: const Duration(milliseconds: 400),
              child: Center(child: Text(widget.size[index]['size'])),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 16.0),
      ),
    );
  }
}

// import 'package:diea/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:diea/cubits/add_products/add_products_cubit.dart';

// class ProductSizeListView extends StatefulWidget {
//   const ProductSizeListView({super.key, required this.size});

//   final List<dynamic> size;

//   @override
//   State<ProductSizeListView> createState() => _ProductSizeListViewState();
// }

// class _ProductSizeListViewState extends State<ProductSizeListView> {
//   int selected = -1;

//   @override
//   void initState() {
//     if (widget.size.isEmpty) {
//       BlocProvider.of<AddProductsCubit>(context).selected = '';
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.size.isEmpty ? 0 : 72,
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: ListView.separated(
//         reverse: true,
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: widget.size.length,
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 selected = index;
//                 BlocProvider.of<AddProductsCubit>(context).selected =
//                     widget.size[index]['size'];
//                 BlocProvider.of<AddProductsCubit>(context).price_ =
//                     widget.size[index]['price'];
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: selected == index ? 2.5 : 1,
//                   color: selected == index ? Colors.black : kPrimaryColor,
//                 ),
//                 color: kBackgroundColor,
//                 borderRadius: BorderRadius.circular(50.0),
//               ),
//               child: Center(child: Text(widget.size[index]['size'])),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) =>
//             const SizedBox(width: 16.0),
//       ),
//     );
//   }
// }
