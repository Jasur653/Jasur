import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/entities/cart.dart';
import 'package:clean_one/feautures/carts/domain/repository/cart_repositories.dart';

class AddCartUsecase {
  final CartRepositories repositories;

  AddCartUsecase({required this.repositories});

  Future<SingleCart> call(
      {required int userId, required List<SingleCartModel> products}) {
    return repositories.addCart(userId: userId, products: products);
  }
}
