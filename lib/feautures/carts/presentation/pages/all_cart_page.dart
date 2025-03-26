import 'package:clean_one/core/route_names.dart';
import 'package:clean_one/feautures/carts/presentation/providers/allCart/all_cart_state.dart';
import 'package:clean_one/feautures/carts/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCartPage extends ConsumerStatefulWidget {
  const AllCartPage({super.key});

  @override
  ConsumerState createState() => _AllCartPageState();
}

class _AllCartPageState extends ConsumerState<AllCartPage> {
  void getAllCart() {
    ref.read(allCartProvider.notifier).allCart();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allCartState = ref.watch(allCartProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Card'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addCartPage);
            },
            icon: Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            if (allCartState is AllCartLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (allCartState is AllCartError) Text(allCartState.message),
            if (allCartState is AllCartLoaded)
              Expanded(
                child: ListView.builder(
                    itemCount: allCartState.carts.carts.length,
                    itemBuilder: (context, index) {
                      final getallCart = allCartState.carts.carts[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Column(
                            children: [
                              Text(
                                getallCart.id.toString(),
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
          ],
        ),
      ),
    );
  }
}
