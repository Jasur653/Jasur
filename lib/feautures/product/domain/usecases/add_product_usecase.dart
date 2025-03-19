import 'package:clean_one/feautures/product/domain/entities/add_product.dart';
import 'package:clean_one/feautures/product/domain/entities/product.dart';

import '../../data/model/product_model.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository repository;

  AddProductUsecase(this.repository);

  Future<ProductModel> call({required  ProductModel productModel}) {
    return repository.addProduct(productModel: productModel);
  }
}