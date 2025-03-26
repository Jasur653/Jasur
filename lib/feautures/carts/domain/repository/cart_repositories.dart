import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/entities/cards.dart';
import 'package:clean_one/feautures/carts/domain/entities/cart.dart';

import '../../data/model/cart_model.dart';

abstract class CartRepositories {
  Future<Carts> getAllCart();

  Future<SingleCart> singleCart({required int id});

  Future<SingleCart> addCart(
      {required SingleCartModel singleCartModel });
  Future<ProductOne> deleteCart({required int id});
}
