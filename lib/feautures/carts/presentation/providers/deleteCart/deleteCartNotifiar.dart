
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/deleteCart.dart';
import 'deleteCartState.dart';

class DeleteCartNotifier extends StateNotifier<DeleteCartState> {
  final DeleteCartUsecase deleteCartUsecase;

  DeleteCartNotifier(this.deleteCartUsecase) : super(DeleteCartInitial());

  Future<void> deleteCart(int id) async {
    try {
      state = DeleteCartLoading();
      final deleteCart = await deleteCartUsecase(id: id);
      state = DeleteCartSuccess(deleteCart);
    } catch (e) {
      state = DeleteCartError(e.toString());
    }
  }
}