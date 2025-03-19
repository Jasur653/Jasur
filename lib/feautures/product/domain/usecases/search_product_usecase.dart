import '../entities/all_prpoducts.dart';
import '../repositories/product_repository.dart';

class SearchProductsUsecase {
  final ProductRepository repository;

  SearchProductsUsecase(this.repository);

  Future<AllProducts> call({required String word}) {
    return repository.searchProducts(word: word);
  }
}