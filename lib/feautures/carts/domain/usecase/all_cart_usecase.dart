import 'package:clean_one/feautures/carts/domain/entities/cards.dart';
import 'package:clean_one/feautures/carts/domain/repository/cart_repositories.dart';

class AllCartUsecase {
  final CartRepositories repositories;

  AllCartUsecase(this.repositories);

  Future<Carts> call() {
    return repositories.getAllCart();
  }
}
