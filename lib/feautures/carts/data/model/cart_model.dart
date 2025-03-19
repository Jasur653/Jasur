import '../../domain/entities/cards.dart';

class CartsModel extends Carts {
  const CartsModel({
    required List<CartModel> super.carts,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
    carts: List<CartModel>.from(
        json["carts"].map((x) => CartModel.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "carts": List<dynamic>.from(carts.map((x) => (x as CartModel).toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required List<ProductModel> super.products,
    required super.total,
    required super.discountedTotal,
    required super.userId,
    required super.totalProducts,
    required super.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    products: List<ProductModel>.from(
        json["products"].map((x) => ProductModel.fromJson(x))),
    total: json["total"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    userId: json["userId"],
    totalProducts: json["totalProducts"],
    totalQuantity: json["totalQuantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": List<dynamic>.from(products.map((x) => (x as ProductModel).toJson())),
    "total": total,
    "discountedTotal": discountedTotal,
    "userId": userId,
    "totalProducts": totalProducts,
    "totalQuantity": totalQuantity,
  };
}

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.quantity,
    required super.total,
    required super.discountPercentage,
    required super.discountedTotal,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    total: json["total"]?.toDouble(),
    discountPercentage: json["discountPercentage"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedTotal": discountedTotal,
    "thumbnail": thumbnail,
  };
}
