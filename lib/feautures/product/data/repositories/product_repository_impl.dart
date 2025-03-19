
import 'package:clean_one/feautures/product/data/model/product_model.dart';
import 'package:clean_one/feautures/product/domain/entities/add_product.dart';
import 'package:clean_one/feautures/product/domain/entities/category.dart';

import '../../domain/entities/all_prpoducts.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasoirces/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Product> getSingleProduct({required int id}) {
    return remoteDataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllProducts> getAllProducts() {
    return remoteDataSource.getAllProduct();
  }

  @override
  Future<AllProducts> searchProducts({required String word}) {
    return remoteDataSource.searchProducts(word: word);
  }

  @override
  Future<AllProducts> sortProducts(
      {required String sortName, required String ascDesc}) {
    return remoteDataSource.sortProducts(sortName: sortName, ascDesc: ascDesc);
  }

  @override
  Future<List<Category>> category() {
   return remoteDataSource.category();
  }

  @override
  Future<AllProducts> productsByCategory({required String url}) {
    return remoteDataSource.productByCategory(url: url);
  }

  @override
  Future<ProductModel> addProduct({required  ProductModel productModel}) {
    return remoteDataSource.addProduct(productModel: productModel);
  }
}