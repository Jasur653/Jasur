import 'package:clean_one/feautures/product/data/model/product_model.dart';
import 'package:clean_one/feautures/product/domain/entities/product.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/add_product/add_product_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage({super.key});

  @override
  ConsumerState createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void add() {
    DimensionsModel dimensionsModel = DimensionsModel(depth: 10.9);
    MetaModel metaModel = MetaModel(
        createdAt: "createdAt",
        updatedAt: "updatedAt",
        barcode: "barcode",
        qrCode: "qrCode");
    ReviewModel reviewModel = ReviewModel(rating: 1, comment: 'comment', date: DateTime.now(), reviewerName: 'reviewerName', reviewerEmail: 'reviewerEmail');

    ProductModel productModel = ProductModel(
      // id: 100,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        category: "category",
        price: 10.0,
        discountPercentage: 10.0,
        rating: 10.0,
        stock: 0,
        tags: [],
        brand: "brand",
        sku: "sku",
        weight: 0,
        dimensions: dimensionsModel,
        warrantyInformation: "warrantyInformation",
        shippingInformation: "shippingInformation",
        availabilityStatus: "availabilityStatus",
        reviews: [reviewModel],
        returnPolicy: "returnPolicy",
        meta: metaModel,
        images: [],
        thumbnail: "thumbnail");

    ref.read(addProductProvider.notifier).addProduct(productModel);
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addProductProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'description'),
            ),
            ElevatedButton(
              onPressed: () {
                add();

              },
              child: Text('add'),
            ),
            SizedBox(
              height: 20,
            ),
            if (addState is AddProductLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (addState is AddProductError) Text(addState.message),
            if (addState is AddProductLoaded)
              Expanded(
                child: Text(addState.productModel.title),
              ),
          ],
        ),
      ),
    );
  }
}
