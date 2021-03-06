import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../unit_length.dart';
import '../Providers/products_provider.dart';

class ProductsGridBuilder extends StatelessWidget {
  final bool showFav;
  ProductsGridBuilder(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = showFav ? productsData.getListFav : productsData.getListAll;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: mm * 2,
        mainAxisSpacing: mm * 2,
      ),
      padding: EdgeInsets.all(mm * 1.3),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        );
      },
    );
  }
}
