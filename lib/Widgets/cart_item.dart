import 'package:flutter/material.dart';

import '../unit_length.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String id;
  final int quantity;
  final double price;

  CartItem({this.id, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
