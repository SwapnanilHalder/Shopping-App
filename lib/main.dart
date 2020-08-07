import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        textTheme: GoogleFonts.chilankaTextTheme(
            //Theme.of(context).textTheme,
            ),
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
