import 'package:clean_one/core/route_names.dart';
import 'package:clean_one/feautures/carts/presentation/providers/providers.dart';
import 'package:clean_one/feautures/carts/presentation/providers/single_cart/single_cart_state.dart';
import 'package:clean_one/feautures/carts/presentation/widget/singleCartWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SingleCartPage extends ConsumerStatefulWidget {
  const SingleCartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SingleCartPage> createState() => _SingleCartPageState();
}

class _SingleCartPageState extends ConsumerState<SingleCartPage> {
  final TextEditingController _idController = TextEditingController();

  void _singleCart() {
    final id = int.tryParse(_idController.text.trim());
    if (id != null && id > 0) {
      ref.read(singleCartProvider.notifier).singleCart(id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid cart ID'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final singleCartState = ref.watch(singleCartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Cart"),
        actions: [
          IconButton(
              onPressed: () {Navigator.pushNamed(context, RouteNames.allCartPage);}, icon: Icon(Icons.arrow_circle_right_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cart ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _singleCart,
              child: Text('Get Cart'),
            ),
            SizedBox(
              height: 15,
            ),
            if (singleCartState is SingleCartLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (singleCartState is SingleCartError)
              Text(singleCartState.message),
            if (singleCartState is SingleCartLoaded)
              Singlecartwidget(singleCart: singleCartState.singleCart),
          ],
        ),
      ),
    );
  }
}
