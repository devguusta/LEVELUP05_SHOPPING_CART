import 'package:cart/src/bloc/cart_item_block.dart';
import 'package:cart/src/widgets/shop_items_widget.dart';
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
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white30,
        
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/checkout');
            },
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.blueGrey,),
          ),
        
        ],
      ),
      body: ShopItemsWidget(),
      
    );
  }
}



