import '../../../domain/entities/all_prpoducts.dart';

abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final AllProducts allProducts;

  AllProductsLoaded(this.allProducts);
}

class AllProductsError extends AllProductsState {
  final String message;

  AllProductsError(this.message);
}
