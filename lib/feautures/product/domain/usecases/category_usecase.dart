import 'package:clean_one/feautures/product/domain/entities/category.dart';

import '../repositories/product_repository.dart';

class CategoryUsecase {
  final ProductRepository repository;

  CategoryUsecase(this.repository);

  Future<List<Category>> call() {
    return repository.category();
  }
}