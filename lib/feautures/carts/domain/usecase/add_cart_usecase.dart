import 'package:clean_one/feautures/carts/data/model/cart_model.dart';
import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/entities/cart.dart';

import 'package:clean_one/feautures/carts/domain/repository/cart_repositories.dart';

class AddCartUsecase {
  final CartRepositories repositories;

  AddCartUsecase({required this.repositories});

  Future<SingleCart> call(
      {required SingleCartModel singleCartModel }) {
    return repositories.addCart(singleCartModel: singleCartModel);
  }
}
