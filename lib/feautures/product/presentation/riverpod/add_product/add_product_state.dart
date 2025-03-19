import 'package:clean_one/feautures/product/data/model/product_model.dart';
import 'package:clean_one/feautures/product/domain/entities/add_product.dart';
import 'package:clean_one/feautures/product/domain/entities/product.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductLoaded extends AddProductState {
  final ProductModel productModel;
  AddProductLoaded(this.productModel);
}

class AddProductError extends AddProductState {
  final String message;
  AddProductError(this.message);
}