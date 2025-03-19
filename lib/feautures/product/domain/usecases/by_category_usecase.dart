import '../entities/all_prpoducts.dart';
import '../repositories/product_repository.dart';

class ByCategoryUsecase {
  final ProductRepository repository;

  ByCategoryUsecase(this.repository);

  Future<AllProducts> call({required String url}) {
    return repository.productsByCategory(url: url);
  }
}