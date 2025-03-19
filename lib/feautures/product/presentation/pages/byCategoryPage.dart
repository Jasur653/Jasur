
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/product_by_category/by_category_state.dart';
import '../riverpod/product_provider.dart';

class ByCategoryPage extends ConsumerStatefulWidget {
  Map<String, String> data;

  ByCategoryPage({
    super.key,
    required this.data,
  });

  @override
  ConsumerState createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends ConsumerState<ByCategoryPage> {
  void getData({required String url}){
    ref.read(byCategoryProvider.notifier).getCategories(url: url);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData(url: widget.data['url']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final byCategoryState = ref.watch(byCategoryProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data['name']!),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              if (byCategoryState is ByCategoryLoading)
                const Center(child: CircularProgressIndicator()),
              if (byCategoryState is ByCategoryError)
                Text(byCategoryState.message),
              if (byCategoryState is ByCategoryLoaded)
                Expanded(
                  child: ListView.builder(
                    itemCount: byCategoryState.allProducts.products.length,
                    itemBuilder: (context, index) {
                      final product =
                      byCategoryState.allProducts.products[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Image.network(product.thumbnail),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.price.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(product.description),
                      );
                    },
                  ),
                ),
            ],
          ),
        ));
  }
}