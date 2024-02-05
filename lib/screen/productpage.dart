// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniproject/components/navdrawer.dart';
import 'package:miniproject/product/eleproduct.dart';
import 'package:miniproject/product/jewlry.dart';
import 'package:miniproject/product/menproduct.dart';
import 'package:miniproject/product/product.dart';
import 'package:miniproject/product/womenproduct.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedItem = 'All';
  void selectCategory(String category) {
    setState(() {
      selectedItem = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product',
              style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildItem(20, 'All'),
                  buildItem(4, 'Men'),
                  buildItem(6, 'Women'),
                  buildItem(4, 'Jewelry'),
                  buildItem(6, 'Electronics'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Display content based on selected category
            Expanded(
              child: _buildCategoryContent(selectedItem),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContent(String category) {
    switch (category) {
      case 'All':
        return ProductAll();
      case 'Men':
        return ProductMen();
      case 'Women':
        return ProductWomen();
      case 'Jewelry':
        return ProductJewelry();
      case 'Electronics':
        return ProductElectronics();
      default:
        return ProductAll(); // Default to displaying all products
    }
  }

  Widget buildItem(int count, String productName) {
    return Padding(
      padding: EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: productName == selectedItem
              ? Color.fromARGB(255, 250, 175, 89)
              : Colors.grey.withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2,
              color: productName == selectedItem
                  ? Color.fromARGB(255, 232, 241, 92).withOpacity(0.4)
                  : Colors.transparent,
            ),
          ],
        ),
        width: 125,
        child: InkWell(
          onTap: () {
            // Call selectCategory when the category is tapped
            selectCategory(productName);
          },
          child: Row(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  productName,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: productName == selectedItem
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  count.toString(),
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: productName == selectedItem
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
