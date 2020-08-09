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
      body: Card(
        elevation: 1 * mm,
        margin: EdgeInsets.all(2 * mm),
        child: Padding(
          padding: EdgeInsets.all(3 * mm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total : ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer(),
              Chip(
                label: Text('${cartbuilder.getTotalAmount}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .headline6
                            .color)),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("ORDER NOW"),
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
