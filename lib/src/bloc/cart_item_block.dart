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
      {'name': 'Hot Dog', 'price': 90, 'id': 5},
      {'name': 'Mouse', 'price': 20, 'id': 6},
      {'name': 'Computer', 'price': 2090, 'id': 7},
      {'name': 'Feature', 'price': 150, 'id': 8},
      {'name': 'CheeseBurger', 'price': 10, 'id': 9},
      {'name': 'Router', 'price': 50, 'id': 10},
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
  void refreshCart() {
    allItems;
  }
   void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemBlock();
