import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diea/constants.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String name = '';
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('general');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset(
            'assets/icons/Search Icon.svg',
            colorFilter: const ColorFilter.mode(
              kSecondaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        titleSpacing: 0,
        backgroundColor: kBackgroundColor.withOpacity(0.6),
        elevation: 0,
        title: TextField(
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_outlined,
                size: 26,
              ),
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
            border: searchOutlineInputBorder,
            focusedBorder: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorder,
            hintText: "Search",
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('general').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                if (data['name']
                    .toString()
                    .toLowerCase()
                    .contains(name.toLowerCase())) {
                  return ListTile(
                    trailing: Text(
                      data['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold), // TextStyle
                    ), // Text
                    title: Text(
                      data['price'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ), // TextStyle
                    ), // Text
                  ); // ListTile
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(0)),
  borderSide: BorderSide(color: Colors.transparent),
);

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SearchView();
            },
          ),
        );
      },
      icon: SvgPicture.asset(
        'assets/icons/Search Icon.svg',
        width: 26,
        colorFilter: const ColorFilter.mode(
          kSecondaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
