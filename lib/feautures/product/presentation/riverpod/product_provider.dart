

import 'package:clean_one/feautures/product/domain/usecases/add_product_usecase.dart';
import 'package:clean_one/feautures/product/domain/usecases/by_category_usecase.dart';
import 'package:clean_one/feautures/product/domain/usecases/category_usecase.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/add_product/add_product_notifiar.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/add_product/add_product_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/category/category_notifier.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/category/category_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/product_by_category/by_category_nitifiar.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/product_by_category/by_category_state.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/single_product/product_notifier.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/single_product/product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasoirces/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../../domain/usecases/search_product_usecase.dart';
import '../../domain/usecases/sort_product_usecase.dart';
import 'all_products/all_products_notifier.dart';
import 'all_products/all_products_state.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final productRemoteDataSourceProvider =
Provider<ProductRemoteDataSource>((ref) {
  return ProductRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteDataSourceProvider));
});

final getProductUseCaseProvider = Provider<ProductUseCase>((ref) {
  return ProductUseCase(ref.watch(productRepositoryProvider));
});

final getAllProductsUseCaseProvider = Provider<GetAllProductsUsecase>((ref) {
  return GetAllProductsUsecase(ref.watch(productRepositoryProvider));
});
final searchAllProductsUseCaseProvider = Provider<SearchProductsUsecase>((ref) {
  return SearchProductsUsecase(ref.watch(productRepositoryProvider));
});

final sortAllProductUseCaseProvider = Provider<SortProductsUsecase>((ref) {
  return SortProductsUsecase(ref.watch(productRepositoryProvider));
});
final categoryProductUseCaseProvider = Provider<CategoryUsecase>((ref){
  return CategoryUsecase(ref.watch(productRepositoryProvider));
});

final byCategoryUseCaseProvider = Provider<ByCategoryUsecase>((ref){
  return ByCategoryUsecase(ref.watch(productRepositoryProvider));
});
final addProductUseCaseProvider = Provider<AddProductUsecase>((ref){
  return AddProductUsecase(ref.watch(productRepositoryProvider));
});

final productProvider =
StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ref.watch(getProductUseCaseProvider));
});

final allProductsProvider =
StateNotifierProvider<AllProductsNotifier, AllProductsState>((ref) {
  return AllProductsNotifier(
    getAllProduct: ref.watch(getAllProductsUseCaseProvider),
    searchProductsUsecase: ref.watch(searchAllProductsUseCaseProvider),
    sortProductsUsecase: ref.watch(sortAllProductUseCaseProvider),
  );
});
final categoryProvider = StateNotifierProvider<CategoryNotifier,CategoryState>((ref){
  return CategoryNotifier(categoryUsecase: ref.watch(categoryProductUseCaseProvider));
});
final byCategoryProvider = StateNotifierProvider<ByCategoryNotifier,ByCategoryState>((ref){
  return ByCategoryNotifier(ref.watch(byCategoryUseCaseProvider));
});
final addProductProvider = StateNotifierProvider<AddProductNotifiar, AddProductState>((ref){
  return AddProductNotifiar(ref.watch(addProductUseCaseProvider));
});