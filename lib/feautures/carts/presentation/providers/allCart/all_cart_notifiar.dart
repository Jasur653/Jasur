import 'package:clean_one/feautures/carts/domain/usecase/all_cart_usecase.dart';
import 'package:clean_one/feautures/carts/presentation/providers/allCart/all_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllCartNotifiar extends StateNotifier<AllCartState> {
  final AllCartUsecase allCartUsecase;

  AllCartNotifiar( this.allCartUsecase) : super(AllCartInitial());

  Future<void> allCart() async {
    state = AllCartLoading();
    try {
      final getAllCarts = await allCartUsecase();
      state = AllCartLoaded(getAllCarts);
    } catch (e) {
      state = AllCartError(e.toString());
    }
  }
}
