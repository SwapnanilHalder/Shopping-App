import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/product_builder.dart';
import 'package:shopping_app/Screens/product_details_screen.dart';

import '../unit_length.dart';
import '../Screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductBuilder _item = Provider.of<ProductBuilder>(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: _item.id,
            );
          },
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            _item.title,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
          ),
          leading: IconButton(
            icon: Icon(
                _item.isFavourite ? Icons.favorite : Icons.favorite_border),
            iconSize: 3.3 * mm,
            onPressed: () {
              _item.toggleFavourite();
            },
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
