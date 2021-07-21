import 'dart:async';


class CartItemBlock {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      {'name': 'KeyBoard', 'price': 40, 'id': 1},
      {'name': 'The Mamba Mentality', 'price': 100, 'id': 2},
      {'name': 'Logo Design', 'price': 10, 'id': 3},
      {'name': 'Chesser', 'price': 90, 'id': 4},
    ],
    'cart items': []
  };
  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }
  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }
   void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemBlock();
