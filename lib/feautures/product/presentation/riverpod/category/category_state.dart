

import '../../../domain/entities/category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;
  CategoryLoaded(this.category);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}