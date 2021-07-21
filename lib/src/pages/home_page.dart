import 'package:cart/src/bloc/cart_item_block.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/checkout');
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: ShopItemsWidget(),
      
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  const ShopItemsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return( snapshot.data!as Map)["shop items"].length >0 ? shopItemsListBuilder(snapshot)
        : Center(child: Text("All items in shop have been taken"),);
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        title: Text(shopList[i]['name']),
        subtitle: Text("\$${shopList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.addToCart(shopList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}