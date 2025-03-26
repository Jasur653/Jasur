import 'package:clean_one/feautures/carts/data/model/single_cart_model.dart';
import 'package:clean_one/feautures/carts/domain/usecase/add_cart_usecase.dart';
import 'package:clean_one/feautures/carts/domain/usecase/single_cart_usecase.dart';
import 'package:clean_one/feautures/carts/presentation/providers/single_cart/single_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/cart_model.dart';

class SingleCartNotifiar extends StateNotifier<SingleCartState> {
  final SingleCartUsecase singleCartUsecase;
  final AddCartUsecase addCartUsecase;

  SingleCartNotifiar(
      {required this.singleCartUsecase, required this.addCartUsecase})
      : super(SingleCartInitial());

  Future<void> singleCart(int id) async {
    state = SingleCartLoading();
    try {
      final getSingleAllCarts = await singleCartUsecase(id: id);
      state = SingleCartLoaded(getSingleAllCarts);
    } catch (e) {
      state = SingleCartError(e.toString());
    }
  }

  Future<void> addCart(
       SingleCartModel singleCartModel) async {
    state = SingleCartLoading();
    try {
      final addCarts = await addCartUsecase(singleCartModel: singleCartModel);
      state = SingleCartLoaded(addCarts);
    } catch (e) {
      state = SingleCartError(e.toString());
    }
  }
}
