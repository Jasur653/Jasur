import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/product/data/model/product_model.dart';
import 'package:clean_one/feautures/product/domain/entities/product.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/add_product/add_product_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCartPage extends ConsumerStatefulWidget {
  const AddCartPage({super.key});

  @override
  ConsumerState createState() => _AddCartPageState();
}

class _AddCartPageState extends ConsumerState<AddCartPage> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController productsController = TextEditingController();

  void addCart() {
    SingleCartModel singleCartModel = SingleCartModel(id: 10,
        products: 
        total: 10.0,
        discountedTotal: 10,
        userId: userIdController.,
        totalProducts: 10,
        totalQuantity: 10);
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addProductProvider);

    return Scaffold();
  }
}
