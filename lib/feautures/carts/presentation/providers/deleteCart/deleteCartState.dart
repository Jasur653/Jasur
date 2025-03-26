
import 'package:clean_one/feautures/carts/domain/entities/cart.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartSuccess extends DeleteCartState {
  final ProductOne productOne;

  DeleteCartSuccess(this.productOne);

  @override
  List<Object?> get props => [productOne];
}

class DeleteCartError extends DeleteCartState {
  final String message;

  DeleteCartError(this.message);

  @override
  List<Object?> get props => [message];
}
