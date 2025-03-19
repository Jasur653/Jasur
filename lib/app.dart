import 'package:flutter/material.dart';

import 'core/route_ganerator.dart';
import 'core/route_names.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.singleCartPage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}