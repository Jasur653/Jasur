import 'package:clean_one/feautures/product/data/model/add_product_model.dart';
import 'package:clean_one/feautures/product/data/model/category_model.dart';
import 'package:clean_one/feautures/product/domain/entities/all_prpoducts.dart';
import 'package:clean_one/feautures/product/domain/entities/category.dart';
import 'package:dio/dio.dart';

import '../model/all_products_model.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getSingleProduct({required int id});

  Future<AllProductsModel> getAllProduct();

  Future<AllProductsModel> searchProducts({required String word});

  Future<AllProductsModel> sortProducts(
      {required String sortName, required String ascDesc});

  Future<List<Category>> category();

  Future<AllProducts> productByCategory({required String url});

  Future<ProductModel> addProduct({required ProductModel productModel});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getSingleProduct({required int id}) async {
    final response = await dio.get(
      'https://dummyjson.com/products/$id',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get single product');
    }
  }

  @override
  Future<AllProductsModel> getAllProduct() async {
    final response = await dio.get('https://dummyjson.com/products');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<AllProductsModel> searchProducts({required String word}) async {
    final response =
        await dio.get('https://dummyjson.com/products/search?q=$word');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<AllProductsModel> sortProducts(
      {required String sortName, required String ascDesc}) async {
    final response = await dio
        .get('https://dummyjson.com/products?sortBy=$sortName&order=$ascDesc');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to sort');
    }
  }

  @override
  Future<List<Category>> category() async {
    final response = await dio.get('https://dummyjson.com/products/categories');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // return CategoryModel.fromJson(response.data);
      return categoriesFromJson(response.data);
    } else {
      throw Exception('Failed to sort');
    }
  }

  @override
  Future<AllProducts> productByCategory({required String url}) async {
    final response = await dio.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AllProductsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get getProductsByCategory');
    }
  }

  @override
  Future<ProductModel> addProduct({required ProductModel productModel}) async {
    final response = await dio.post(
      'https://dummyjson.com/products/add',
      data: productModel.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception('Failed to add product');
    }
  }
}
