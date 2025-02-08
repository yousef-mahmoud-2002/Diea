import 'package:diea/constants.dart';
import 'package:diea/views/categories_view.dart';
import 'package:diea/views/general_product_view.dart';
import 'package:diea/widgets/popular.dart';
import 'package:flutter/material.dart';
import 'package:diea/views/search_view.dart';
import 'package:diea/widgets/custom_title.dart';
import 'package:diea/widgets/buttons/cart_view_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const CustomTitle(),
        leading: const SearchButton(),
        backgroundColor: Colors.transparent,
        actions: const [CartViewButton()],
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(height: 1, color: kPrimaryColor, thickness: 0.7),
        ),
      ),
      body:
          //  MyHomePage()
          const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                'الأصناف',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CategoriesView(),
            Divider(height: 0, color: kPrimaryColor, thickness: 0.5),
            Popular(),
            Divider(height: 0, color: kPrimaryColor),
            GetGeneralCategoryView(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
