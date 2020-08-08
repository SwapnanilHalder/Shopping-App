import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../unit_length.dart';
import '../Widgets/products_grid_builder.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const navigator = '/';

  
    

  @override
  Widget build(BuildContext context) {
    getheight(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Shop",
          style: GoogleFonts.chilanka(),
        ),
      ),
      body: ProductsGridBuilder(),
    );
  }
}


