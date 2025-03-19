import '../../domain/entities/add_product.dart';

class AddProductModel extends AddProduct {
  AddProductModel({
    required super.id,
    required super.title,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(id: json['id'] ?? 0, title: json['title'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
