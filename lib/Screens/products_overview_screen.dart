import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_builder.dart';
import '../Widgets/badge.dart';
import '../Widgets/products_grid_builder.dart';
import '../unit_length.dart';

enum selectedEntry {
  favourites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const navigator = '/';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    getheight(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Shop",
          style: GoogleFonts.chilanka(),
        ),
        actions: [
          Consumer<CartBuilder>(
            builder: (context, cartbuilder, ch) {
              return Badge(
                child: ch,
                value: cartbuilder.getTotalItems.toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Favourites"),
                value: selectedEntry.favourites,
              ),
              PopupMenuItem(
                child: Text("All"),
                value: selectedEntry.all,
              ),
            ],
            onSelected: (value) {
              setState(() {
                if (value == selectedEntry.all)
                  showFav = false;
                else
                  showFav = true;
              });
            },
          )
        ],
      ),
      body: ProductsGridBuilder(showFav),
    );
  }
}
