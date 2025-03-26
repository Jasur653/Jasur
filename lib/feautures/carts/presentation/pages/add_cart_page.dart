import 'package:clean_one/core/route_names.dart';
import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/presentation/providers/providers.dart';
import 'package:clean_one/feautures/carts/presentation/providers/single_cart/single_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/cart_model.dart';

class AddCartPage extends ConsumerStatefulWidget {
  const AddCartPage({super.key});

  @override
  ConsumerState createState() => _AddCartPageState();
}

class _AddCartPageState extends ConsumerState<AddCartPage> {
  TextEditingController userIdController = TextEditingController();

  void addCart() {
    ProductSingleModel productSingleModel = ProductSingleModel(
      id: 1,
      title: "title",
      price: 10.0,
      quantity: 2,
      total: 1.1,
      discountPercentage: 1.1,
      discountedTotal: 1.1,
      thumbnail: "",
    );
    SingleCartModel singleCartModel = SingleCartModel(
        id: 1,
        products: [productSingleModel, productSingleModel, productSingleModel],
        total: 5.0,
        discountedTotal: 1.0,
        userId: 10,
        totalProducts: 10,
        totalQuantity: 10);
    ref.read(singleCartProvider.notifier).addCart(singleCartModel);
  }

  @override
  Widget build(BuildContext context) {
    final addCartState = ref.watch(singleCartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            onPressed: () {Navigator.pushNamed(context, RouteNames.deleteCartPage);},
            icon: Icon(Icons.arrow_right_alt_outlined),
          ),
        ],
        title: const Text(
          "Add Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: "User id"),
            ),
            ElevatedButton(
              onPressed: () {
                addCart();
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            if (addCartState is SingleCartLoading)
              Center(child: CircularProgressIndicator()),
            if (addCartState is SingleCartError) Text(addCartState.message),
            if (addCartState is SingleCartLoaded)
              Text(
                addCartState.singleCart.totalQuantity.toString(),
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
