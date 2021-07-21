import 'package:cart/src/bloc/cart_item_block.dart';
import 'package:cart/src/widgets/shop_items_list.dart';
import 'package:flutter/material.dart';

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