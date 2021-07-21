import 'package:cart/src/bloc/cart_item_block.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({ Key? key }) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Carrinho'),
      backgroundColor: Colors.white30,
      ),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context,snapshot) {
          return (snapshot.data as Map)['cart items'].length > 0
          ? Column(
            children: [
              Expanded(child: checkoutListBuilder(snapshot)),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Checkout"),
                  // style: TextButton.styleFrom(
                  //   primary: Theme.of(context).primaryColor,
                    
                  // )
                ),
              ),
            ],
          ) :      
          Center(child: Text("You haven´t taken any item yey"));
        },
      ),
    );
  }
}

    Widget checkoutListBuilder(snapshot) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
        return ListTile(
          title: Text(cartList[i]['name']),
          subtitle: Text("\$${cartList[i]['price']}"),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              bloc.removeFromCart(cartList[i]);
            },
          ),
          onTap: () {},
        );
      },
    ),
  );
}

