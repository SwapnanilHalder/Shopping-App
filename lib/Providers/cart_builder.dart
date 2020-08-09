import 'package:flutter/foundation.dart';

class CartItemBuilder {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItemBuilder({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class CartBuilder with ChangeNotifier {
  Map<String, CartItemBuilder> _cartList = {};

  Map<String, CartItemBuilder> get getCart {
    return {..._cartList};
  }

  int get getTotalItems {
    int total = 0;
    _cartList.forEach(
      (key, value) {
        total += _cartList[key].quantity;
      },
    );
    return total;
  }

  double get getTotalAmount {
    double total = 0;
    _cartList.forEach(
      (key, item) {
        total += item.price * item.quantity;
      },
    );
    return total;
  }

  void addInCart({String productId, double price, String title}) {
    if (_cartList.containsKey(productId)) {
      _cartList.update(
          productId,
          (item) => CartItemBuilder(
              id: item.id,
              price: item.price,
              quantity: item.quantity + 1,
              title: item.title));
    } else {
      _cartList.putIfAbsent(
        productId,
        () => CartItemBuilder(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }
}
