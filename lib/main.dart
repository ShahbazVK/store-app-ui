// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/categoriesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: CategoriesPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List products = [
    [
      "Jacket A",
      "https://www.gulahmedshop.com/media/wysiwyg/cms-page/01_men_clothes/04_unstitched.jpg",
      499
    ],
    [
      "Maxi B",
      "https://cdn.shopify.com/s/files/1/0083/4692/7181/products/p15413-readymade-chiffon-maxi-dress_580x.jpg?v=1663153067",
      299
    ],
    [
      "Maxi C",
      "https://www.pakstyle.pk/img/products/s/p14229-embroidered-net-maxi-dress.jpg",
      899
    ],
    [
      "Jacket D",
      "https://assets.vogue.com/photos/5891e0ebb482c0ea0e4db2a8/4:3/w_2560%2Cc_limit/02-lestrange.jpg",
      499
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesPage()));
          },
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.category,
            color: Colors.pink,
          ),
        ),
        title: Text(
          "HOME",
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.supervised_user_circle_sharp,
                color: Colors.pink,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Color.fromARGB(255, 221, 217, 217),
                  filled: true,
                  suffixIcon: Icon(Icons.search_sharp),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: [
                  "https://static-01.daraz.pk/p/167ffbb15e5d376ede94bff3eb4694b8.jpg",
                  "https://rukminim1.flixcart.com/image/332/398/xif0q/shoe/j/z/m/6-9273-6-world-wear-footwear-black-original-imagghh9cgkfmr2x-bb.jpeg?q=50",
                  "https://static-01.daraz.pk/p/167ffbb15e5d376ede94bff3eb4694b8.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Container(
                          child: ClipRRect(
                            child: Image.network(i, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        // 'text $i',
                        // style: TextStyle(fontSize: 16.0),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Latest Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.pink,
                      ))
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Color.fromARGB(255, 233, 233, 233),
                    child: GridTile(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$' + products[index][2].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  products[index][1],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              products[index][0],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
