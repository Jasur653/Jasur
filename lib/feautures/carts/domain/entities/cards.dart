import 'package:equatable/equatable.dart';

class Carts extends Equatable {
  final List<Cart> carts;
  final int total;
  final int skip;
  final int limit;

  const Carts({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [carts, total, skip, limit];
}

class Cart extends Equatable {
  final int id;
  final List<Product> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  const Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  @override
  List<Object?> get props => [
    id,
    products,
    total,
    discountedTotal,
    userId,
    totalProducts,
    totalQuantity,
  ];
}

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    quantity,
    total,
    discountPercentage,
    discountedTotal,
    thumbnail,
  ];
}
