import 'package:clean_one/feautures/product/domain/usecases/add_product_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/product_model.dart';
import 'add_product_state.dart';

class AddProductNotifiar extends StateNotifier<AddProductState> {
  final AddProductUsecase addProductUsecase;

  AddProductNotifiar(this.addProductUsecase) : super(AddProductInitial());

  Future<void> addProduct( ProductModel productModel) async {
    state = AddProductLoading();
    try {
      final product = await addProductUsecase(productModel: productModel);
      state = AddProductLoaded(product);
    } catch (e) {
      state = AddProductError(e.toString());
    }
  }
}