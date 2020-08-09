import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_builder.dart';
import '../unit_length.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartbuilder = Provider.of<CartBuilder>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(3 * mm),
        child: Row(
          children: [
            Text(
              "Total : ",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(width: 4 * mm),
            Chip(
              label: Text('${cartbuilder.getTotalAmount}'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
