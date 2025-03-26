import 'package:clean_one/feautures/carts/domain/entities/cart.dart';

import '../repository/cart_repositories.dart';

class DeleteCartUsecase {
  final CartRepositories repositories;

  DeleteCartUsecase(this.repositories);

  Future<ProductOne> call({required int id}) {
    return repositories.deleteCart(id: id);
  }
}