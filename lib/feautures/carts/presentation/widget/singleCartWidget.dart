import 'package:clean_one/feautures/carts/domain/entities/cart.dart';
import 'package:flutter/material.dart';

class Singlecartwidget extends StatelessWidget {
  final SingleCart singleCart;
  const Singlecartwidget({super.key, required this.singleCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(top: 20),
      child: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(singleCart.totalQuantity.toString(),),
          SizedBox(height: 10,),
          Text(singleCart.discountedTotal.toString()),
        ],
      ),),
    );
  }
}
