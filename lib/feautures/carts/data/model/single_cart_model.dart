import '../../domain/entities/cart.dart';

class SingleCartModel extends SingleCart {
  SingleCartModel({
    required int id,
    required List<ProductOne> products,
    required double total,
    required double discountedTotal,
    required int userId,
    required int totalProducts,
    required int totalQuantity,
  }) : super(
    id: id,
    products: products,
    total: total,
    discountedTotal: discountedTotal,
    userId: userId,
    totalProducts: totalProducts,
    totalQuantity: totalQuantity,
  );

  factory SingleCartModel.fromJson(Map<String, dynamic> json) {
    return SingleCartModel(
      id: json['id'] as int? ?? 0,
      products: (json['products'] as List<dynamic>?)
          ?.map((product) => ProductSingleModel.fromJson(product as Map<String, dynamic>))
          .toList() ??
          [],
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble() ?? 0.0,
      userId: json['userId'] as int? ?? 0,
      totalProducts: json['totalProducts'] as int? ?? 0,
      totalQuantity: json['totalQuantity'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => (product as ProductSingleModel).toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}

class ProductSingleModel extends ProductOne {
  ProductSingleModel({
    required int id,
    required String title,
    required double price,
    required int quantity,
    required double total,
    required double discountPercentage,
    required double discountedTotal,
    required String thumbnail,
  }) : super(
    id: id,
    title: title,
    price: price,
    quantity: quantity,
    total: total,
    discountPercentage: discountPercentage,
    discountedTotal: discountedTotal,
    thumbnail: thumbnail,
  );

  factory ProductSingleModel.fromJson(Map<String, dynamic> json) {
    return ProductSingleModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'] as int? ?? 0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      discountedTotal: (json['discountedTotal'] as num?)?.toDouble() ?? 0.0,
      thumbnail: json['thumbnail'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }
}