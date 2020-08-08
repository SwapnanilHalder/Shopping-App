import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/product_builder.dart';
import '../Providers/products_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product_details_screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final ProductBuilder selectedProduct = Provider.of<ProductsProvider>(context, listen: false).findbyId(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(selectedProduct.imageUrl),
          ),
          Text(selectedProduct.description),
        ],
      ),
    );
  }
}
