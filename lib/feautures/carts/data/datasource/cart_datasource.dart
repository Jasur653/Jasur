import 'package:clean_one/feautures/carts/data/model/cart_model.dart';
import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/entities/cards.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/cart.dart';

abstract class CartRemoteDataSource {
  Future<CartsModel> gatAllCart();
  Future<SingleCartModel> singleCart({required int id});
  Future<SingleCartModel> addCart(
      {required int userId,required List<SingleCartModel> products});
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl({required this.dio});


  @override
  Future<CartsModel> gatAllCart() async {
    final response = await dio.get('https://dummyjson.com/carts');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CartsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<SingleCartModel> singleCart({required int id})async {
    final response = await dio.get('https://dummyjson.com/carts/$id');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SingleCartModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get all products');
    }
  }

  @override
  Future<SingleCartModel> addCart({required int userId, required List<SingleCartModel> products}) async{

      final requestData = {
        'userId': userId,
        'products': products.map((product) => {
          'id': product.id,
          'quantity': product.totalQuantity,
        }).toList(),
      };

      final response = await dio.post(
        'https://dummyjson.com/carts/add',
        data: requestData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return SingleCartModel.fromJson(response.data);
      } else {
        throw Exception('Failed to add cart: ${response.statusCode}');
      }
    }
  }





