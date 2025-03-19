import 'package:clean_one/feautures/carts/data/datasource/cart_datasource.dart';
import 'package:clean_one/feautures/carts/data/model/cart_model.dart';
import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/entities/cards.dart';
import 'package:clean_one/feautures/carts/domain/entities/cart.dart';
import 'package:clean_one/feautures/carts/domain/repository/cart_repositories.dart';

class CartRepositoriesImpl implements CartRepositories{
  final CartRemoteDataSource remoteDataSource;
  CartRepositoriesImpl(this.remoteDataSource);
  @override
  Future<Carts> getAllCart() {
   return remoteDataSource.gatAllCart();
  }

  @override
  Future<SingleCart> singleCart({required int id}) {
    return remoteDataSource.singleCart(id: id);
  }

  @override
  Future<SingleCart> addCart({required int userId, required List<SingleCartModel> products}) {
   return remoteDataSource.addCart(userId: userId, products: products);
  }

}