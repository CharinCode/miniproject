// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject/model/shopping.dart';

class ProductMen extends StatefulWidget {
  const ProductMen({super.key});

  @override
  State<ProductMen> createState() => _ProductMenState();
}

class _ProductMenState extends State<ProductMen> {
  late List<dynamic> listShopping; // Use late keyword

  Future<List> getApiShopping() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var shoppingData = json.decode(response.body);
      List<dynamic> shopdata = shoppingData;
      shopdata.map((e) => Shopping.fromJson(e)).toList();
      listShopping = shopdata;
      List menClothingProducts = shopdata
          .where((product) => product['category'] == "men's clothing")
          .toList();
      log(menClothingProducts.length.toString());
      return menClothingProducts;
    } else {
      throw Exception('Failed to load shopping data');
    }
  }

  @override
  void initState() {
    super.initState();
    getApiShopping();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApiShopping(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          listShopping = snapshot.data!; // Update the list
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listShopping.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 225),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(7),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ]),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.right,
                                  '${listShopping[index]['price']}\$',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey.shade200),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listShopping[index]['image']))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '${listShopping[index]['title']}',
                              style: GoogleFonts.quicksand(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              );
            },
          );
        } else {
          return Text('Unknown error');
        }
      },
    );
  }
}
