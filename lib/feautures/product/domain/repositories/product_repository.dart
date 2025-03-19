import 'package:clean_one/feautures/product/data/model/product_model.dart';
import 'package:clean_one/feautures/product/domain/entities/category.dart';

import '../entities/all_prpoducts.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> getSingleProduct({required int id});

  Future<AllProducts> getAllProducts();

  Future<AllProducts> searchProducts({required String word});

  Future<AllProducts> sortProducts(
      {required String sortName, required String ascDesc});

  Future<List<Category>> category();

  Future<AllProducts> productsByCategory({required String url});

  Future<ProductModel> addProduct({required ProductModel productModel});
}
