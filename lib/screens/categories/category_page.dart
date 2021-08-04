import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/theme.dart';
import '../../models/Product.dart';

class Category extends StatelessWidget {
  static String routeName = '/category_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Name of the chosen category",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 3,
        shape: Border(bottom: BorderSide(color: Colors.grey[300])),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: getProportionateScreenHeight(20),
                  ),
                  itemCount: demoProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: demoProducts[index]);
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
