import 'package:flutter/material.dart';

double mm, height, ratio, width, height1;

void getheight(BuildContext context) {
  height1 = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
  height = height1 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom ;
  ratio = height / width;
  mm = width / 67;
  print("Available Width : $width");
  print("Available Height : $height");
  print("1 mm : ${mm.toStringAsFixed(2)}");
  print("Ratio : ${ratio.toStringAsFixed(2)}");
}
