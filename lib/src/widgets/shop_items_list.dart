import 'package:cart/src/bloc/cart_item_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget shopItemsListBuilder(snapshot) {
  

  return StaggeredGridView.countBuilder(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    padding: EdgeInsets.all(8),
    primary: false,
    shrinkWrap: true,
    itemCount: snapshot.data["shop items"].length,
    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
    itemBuilder: (BuildContext context,int index) {
      final shopList = snapshot.data["shop items"];
      return Card(
        color: Colors.blueGrey.shade300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6),
            ),       
          ),
          
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${shopList[index]['name']}',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.58),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                      ),
                      ),
                  ),
                  IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 24.0,top: 14),
                child: Icon(Icons.add_shopping_cart, color: Color.fromRGBO(0,0,0,0.54)),
              ),
              onPressed: () {
                bloc.addToCart(shopList[index]);
              },
            ),
                ],
              ),     
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: Text("Price: \$${shopList[index]['price']}",
                style: TextStyle(
                     color: Color.fromRGBO(0, 0, 0, 0.54),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.15,
                ),
                ),
              ),
        
            ],
          ),
        ),
      );
    },
  );
}


// Card(
//               child: ListTile(
//           title: Text(shopList[index]['name']),
//           subtitle: Text("\$${shopList[index]['price']}"),
          // trailing: IconButton(
          //   icon: Icon(Icons.add_shopping_cart),
          //   onPressed: () {
          //     bloc.addToCart(shopList[index]);
          //   },
          // ),
//           onTap: () {},
//         ),
      // );