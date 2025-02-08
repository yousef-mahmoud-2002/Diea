import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:diea/constants.dart';
import 'package:diea/views/get_category_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categoriespics.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return GetCategoryView(
                  category: categoriesList[itemIndex],
                  categoryTitle: categoriesTitleList[itemIndex],
                );
              },
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  height: 100,
                  categoriespics[itemIndex],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 35,
                width: double.infinity,
                color: kBackgroundColor.withOpacity(0.4),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    categoriesTitleList[itemIndex],
                    style: const TextStyle(
                      // color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      options: CarouselOptions(
        enlargeFactor: 0,
        viewportFraction: 1,
        reverse: true,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlay: true,
        enlargeCenterPage: true,
        initialPage: 0,
      ),
    );
  }
}

final List<String> categoriespics = [
  'assets/images/firstCategory.webp',
  'assets/images/secondCategory.jfif',
  'assets/images/thirdCategory.webp',
  'assets/images/fourthCategory.webp',
  // 'assets/images/fifthCategory.webp',
  'assets/images/sixthCategory.jfif',
  'assets/images/seventhCategory.jfif',
  'assets/images/eighthCategory.jfif',
  'assets/images/ninthCategory.jfif',
];

final List<CollectionReference> categoriesList = [
  FirebaseFirestore.instance.collection('firstCategory'),
  FirebaseFirestore.instance.collection('secondCategory'),
  FirebaseFirestore.instance.collection('thirdCategory'),
  FirebaseFirestore.instance.collection('fourthCategory'),
  // FirebaseFirediea.instance.collection('fifthCategory'),
  FirebaseFirestore.instance.collection('sixthCategory'),
  FirebaseFirestore.instance.collection('seventhCategory'),
  FirebaseFirestore.instance.collection('eighthCategory'),
  FirebaseFirestore.instance.collection('ninthCategory'),
];

final List<String> categoriesTitleList = [
  'دهان',
  'كشافات و أضوية',
  'تجهيزات الحمام',
  'مضخات مياه ',
  // 'دريل',
  'عدد يدوية',
  'لوازم مستودعات',
  'وعدد و أجهزة كهربائية',
  'كراتين و مواد تغليف',
];
