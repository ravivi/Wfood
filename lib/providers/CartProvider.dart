import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;

  const CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
       this.image,
      });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(String productId, double price, String title, String image,int quantity) {
    if (_items.containsKey(productId)) {
      //...changer la quantity
      _items.update(
          productId,
          (exitingCartItem) => (quantity==1)? CartItem(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity + 1,
              image: exitingCartItem.image
              ):CartItem(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity + quantity,
              image: exitingCartItem.image
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () =>(quantity>1)? CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: quantity,
                image: image
              ):CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
                image: image
              ));
    }
    notifyListeners();
  }
   void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void removeSingleItem(String productId){
    if(!items.containsKey(productId)){
      return ;
    }
    if(_items[productId].quantity>1){
      _items.update(
          productId,
          (exitingCartItem) => CartItem(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              price: exitingCartItem.price,
              quantity: exitingCartItem.quantity-1
              ));
    }
    else{
      _items.remove(productId);
    }
    notifyListeners();

  }
  void clear(){
    _items = {};
    notifyListeners();
  }
}
