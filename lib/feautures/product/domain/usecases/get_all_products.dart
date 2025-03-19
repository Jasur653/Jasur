import '../entities/all_prpoducts.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository repository;

  GetAllProductsUsecase(this.repository);

  Future<AllProducts> call() {
    return repository.getAllProducts();
  }
}