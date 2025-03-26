import 'package:clean_one/core/route_names.dart';
import 'package:clean_one/feautures/carts/presentation/pages/add_cart_page.dart';
import 'package:clean_one/feautures/carts/presentation/pages/all_cart_page.dart';
import 'package:clean_one/feautures/carts/presentation/pages/deletePage.dart';
import 'package:clean_one/feautures/carts/presentation/pages/single_cart_page.dart';
import 'package:clean_one/feautures/product/presentation/pages/add_product_page.dart';
import 'package:clean_one/feautures/product/presentation/pages/category_page.dart';
import 'package:flutter/material.dart';

import '../feautures/auth/presentation/pages/sign_in.dart';
import '../feautures/product/presentation/pages/all_products_page.dart';
import '../feautures/product/presentation/pages/byCategoryPage.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.allProductsPage:
        return MaterialPageRoute(builder: (_) => const AllProductsPage());
      case RouteNames.categoryPage:
        return MaterialPageRoute(builder: (_) => const CategoryPage());
      case RouteNames.byCategoryPage:
        final categoryData = routeSettings.arguments as Map<String, String>;
        return MaterialPageRoute(
            builder: (_) => ByCategoryPage(data: categoryData));
      case RouteNames.addCategoryPage:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case RouteNames.allCartPage:
        return MaterialPageRoute(builder: (_) => const AllCartPage());
      case RouteNames.singleCartPage:
        return MaterialPageRoute(builder: (_) => const SingleCartPage());
      case RouteNames.addCartPage:
        return MaterialPageRoute(builder: (_) => const AddCartPage());
      case RouteNames.deleteCartPage:
        return MaterialPageRoute(builder: (_) => const DeleteCartPage());
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}