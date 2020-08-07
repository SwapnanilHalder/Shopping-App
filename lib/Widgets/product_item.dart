import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import '../unit_length.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 2.3 * mm),
          ),
          leading: IconButton(
            icon: Icon(Icons.favorite),
            iconSize: 3.3 * mm,
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            iconSize: 3.3 * mm,
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
