import 'package:clean_one/feautures/carts/data/datasource/cart_datasource.dart';
import 'package:clean_one/feautures/carts/data/repository/cart_repositories_impl.dart';
import 'package:clean_one/feautures/carts/domain/repository/cart_repositories.dart';
import 'package:clean_one/feautures/carts/domain/usecase/add_cart_usecase.dart';
import 'package:clean_one/feautures/carts/domain/usecase/all_cart_usecase.dart';
import 'package:clean_one/feautures/carts/domain/usecase/single_cart_usecase.dart';
import 'package:clean_one/feautures/carts/presentation/providers/allCart/all_cart_notifiar.dart';
import 'package:clean_one/feautures/carts/presentation/providers/allCart/all_cart_state.dart';
import 'package:clean_one/feautures/carts/presentation/providers/single_cart/single_cart_notifiar.dart';
import 'package:clean_one/feautures/carts/presentation/providers/single_cart/single_cart_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final cartRemoteDataSourceProvider = Provider<CartRemoteDataSource>((ref) {
  return CartRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final cartRepositoryProvider = Provider<CartRepositories>((ref) {
  return CartRepositoriesImpl(ref.watch(cartRemoteDataSourceProvider));
});

final allCartUseCaseProvider = Provider<AllCartUsecase>((ref) {
  return AllCartUsecase(ref.watch(cartRepositoryProvider));
});
final singleCartUseCaseProvider = Provider<SingleCartUsecase>((ref) {
  return SingleCartUsecase(ref.watch(cartRepositoryProvider));
});
final addCartUseCaseProvider = Provider<AddCartUsecase>((ref) {
  return AddCartUsecase(repositories: ref.watch(cartRepositoryProvider));
});

final allCartProvider =
    StateNotifierProvider<AllCartNotifiar, AllCartState>((ref) {
  return AllCartNotifiar(ref.watch(allCartUseCaseProvider));
});
final singleCartProvider =
    StateNotifierProvider<SingleCartNotifiar, SingleCartState>((ref) {
  return SingleCartNotifiar(
      singleCartUsecase: ref.watch(singleCartUseCaseProvider),
      addCartUsecase: ref.watch(addCartUseCaseProvider));
});
