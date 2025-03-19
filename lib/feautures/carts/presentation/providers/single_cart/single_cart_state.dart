import '../../../domain/entities/cart.dart';

abstract class SingleCartState {}

class SingleCartInitial extends SingleCartState {}

class SingleCartLoading extends SingleCartState {}

class SingleCartLoaded extends SingleCartState {
  final SingleCart singleCart;

  SingleCartLoaded(this.singleCart);
}

class SingleCartError extends SingleCartState {
  final String message;

  SingleCartError(this.message);
}