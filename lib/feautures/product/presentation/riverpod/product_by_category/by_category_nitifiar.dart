import 'package:clean_one/feautures/product/domain/usecases/by_category_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'by_category_state.dart';

class ByCategoryNotifier extends StateNotifier<ByCategoryState> {
  final ByCategoryUsecase byCategoryUsecase;

  ByCategoryNotifier(this.byCategoryUsecase)
      : super(ByCategoryInitial());

  Future<void> getCategories({required String url}) async {
    state = ByCategoryLoading();
    try {
      final byCategories = await byCategoryUsecase.call(url: url);
      state = ByCategoryLoaded(byCategories);
    } catch (e) {
      state = ByCategoryError(e.toString());
    }
  }
}