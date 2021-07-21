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
      // drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white30,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blueGrey,),
          onPressed: () {}
        ),

        
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/checkout');
            },
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.blueGrey,),
          ),
        
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_outlined, color: Color.fromRGBO(0,0,0, 0.54)),
                  hintText: "Search here",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0,0,0, 0.54),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ShopItemsWidget(),
          ],
        ),
      ),
      
    );
  }
}



