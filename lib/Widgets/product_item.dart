import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_builder.dart';
import '../Providers/product_builder.dart';
import '../Screens/product_details_screen.dart';

import '../unit_length.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductBuilder _item = Provider.of<ProductBuilder>(context, listen: false);
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
          title: SizedBox(
            height: mm * 2,
            child: Text(
              _item.title,
              overflow: TextOverflow.visible,
              maxLines: 2,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontSize: mm * 2.3,
                  ),
            ),
          ),
          leading: Consumer<ProductBuilder>(
            builder: (context, value, child) {
              return IconButton(
                padding: EdgeInsets.symmetric(horizontal: 0),
                icon: Icon(
                    _item.isFavourite ? Icons.favorite : Icons.favorite_border),
                iconSize: 4.6 * mm,
                onPressed: () {
                  _item.toggleFavourite();
                },
                color: Theme.of(context).accentColor,
              );
            },
          ),
          trailing: Consumer<CartBuilder>(
            builder: (context, cartbuilder, child) {
              return IconButton(
                padding: EdgeInsets.symmetric(horizontal: 0),
                alignment: Alignment.center,
                icon: Icon(Icons.add_shopping_cart),
                iconSize: 4.6 * mm,
                onPressed: () {
                  return cartbuilder.addInCart(
                    price: _item.price,
                    productId: _item.id,
                    title: _item.title,
                  );
                },
                color: Theme.of(context).accentColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
