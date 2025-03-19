
import 'package:clean_one/feautures/product/data/model/product_model.dart';

import '../../domain/entities/all_prpoducts.dart';
import '../../domain/entities/product.dart';

class AllProductsModel extends AllProducts {
  AllProductsModel({
    required super.products,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) =>
      AllProductsModel(
        products: (json["products"] as List<dynamic>?)
            ?.map((x) => ProductModel.fromJson(x as Map<String, dynamic>))
            .toList() ?? [],
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );
}