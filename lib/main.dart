import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/themes/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'shared/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mealtime',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
    );
  }
}