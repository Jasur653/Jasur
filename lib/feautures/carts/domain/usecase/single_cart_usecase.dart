import '../entities/cart.dart';
import '../repository/cart_repositories.dart';

class SingleCartUsecase {
  final CartRepositories repositories;

  SingleCartUsecase(this.repositories);

  Future<SingleCart> call({required int id}) {
    return repositories.singleCart(id: id);
  }
}