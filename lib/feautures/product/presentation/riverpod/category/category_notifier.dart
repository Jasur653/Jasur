import 'package:clean_one/feautures/product/domain/usecases/category_usecase.dart';
import 'package:clean_one/feautures/product/presentation/riverpod/category/category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryUsecase categoryUsecase;

  CategoryNotifier({required this.categoryUsecase}) : super(CategoryInitial());
  Future<void> categoryProduct()async{
    state =CategoryLoading();
    try{
      final categories = await categoryUsecase();
      state = CategoryLoaded(categories);
    }catch(e){
      state = CategoryError(e.toString());
    }
  }
}
