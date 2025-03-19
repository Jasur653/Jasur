
import 'package:clean_one/feautures/carts/domain/entities/cards.dart';

abstract class AllCartState {}

class AllCartInitial extends AllCartState {}

class AllCartLoading extends AllCartState {}

class AllCartLoaded extends AllCartState {
  final Carts carts;

  AllCartLoaded(this.carts);
}

class AllCartError extends AllCartState {
  final String message;

  AllCartError(this.message);
}