import 'package:clean_one/feautures/product/domain/entities/all_prpoducts.dart';

abstract class ByCategoryState {}

class ByCategoryInitial extends ByCategoryState {}

class ByCategoryLoading extends ByCategoryState {}

class ByCategoryLoaded extends ByCategoryState {
  final AllProducts allProducts;
  ByCategoryLoaded(this.allProducts);
}

class ByCategoryError extends ByCategoryState {
  final String message;
  ByCategoryError(this.message);
}