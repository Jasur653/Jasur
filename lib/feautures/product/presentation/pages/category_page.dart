import 'package:clean_one/core/route_names.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/category/category_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  void categoryProducts() {
    ref.read(categoryProvider.notifier).categoryProduct();
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.byCategoryPage);
              },
              icon: Icon(Icons.arrow_circle_right_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            if (categoryState is CategoryLoading) CircularProgressIndicator(),
            if (categoryState is CategoryError) Text(categoryState.message),
            if (categoryState is CategoryLoaded)
              Expanded(
                child: ListView.builder(
                    itemCount: categoryState.category.length,
                    itemBuilder: (context, index) {
                      final category = categoryState.category[index];
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.byCategoryPage);
                        },
                        leading: Text(
                          (index + 1).toString(),
                        ),
                        title: Text(
                          category.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
