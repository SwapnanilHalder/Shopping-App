import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_builder.dart';

import '../unit_length.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String id;
  final int quantity;
  final double price;

  CartItem({this.id, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    final cartbuilder = Provider.of<CartBuilder>(context);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: mm * 6,
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.fromLTRB(15, 4, 15, 4),
        padding: EdgeInsets.only(right: mm * 3),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => cartbuilder.removeFromCart(id),
      child: Card(
        margin: EdgeInsets.fromLTRB(15, 4, 15, 4),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(mm),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
              radius: 5 * mm,
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
