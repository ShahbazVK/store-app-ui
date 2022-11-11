// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store_app/main.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);
  final List categories = [
    [
      "Clothes",
      "https://www.ajmery.pk/image/cache/catalog/Products/Sumeras%20Collection/2020/2999/Green%20Solid%20Anarkali%20Kurta.%20AN-79/1-250x350w.jpg"
    ],
    [
      "Electronics",
      "https://researchsnipers.com/wp-content/uploads/2021/02/electronics.jpeg"
    ],
    [
      "Furnitures",
      "https://furniturehub.pk/wp-content/uploads/2021/09/WhatsApp-Image-2022-08-02-at-2.06.56-PM-2.jpeg"
    ],
    [
      "Shoes",
      "http://cdn.shopify.com/s/files/1/0523/9875/1922/collections/GS7030-1_160x_5115ca53-1833-43a4-b941-91141738c845_1200x1200.jpg?v=1660202765"
    ],
    [
      "Others",
      "http://lauralacatis.com/wordpress/wp-content/uploads/2018/06/Bringing-out-the-best-in-others.jpg"
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pink),
        title: Text("Categories",
            style: TextStyle(color: Theme.of(context).accentColor)),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()))
              },
              child: GridTile(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        categories[index][1],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text(
                        categories[index][0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          backgroundColor: Color.fromARGB(158, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
