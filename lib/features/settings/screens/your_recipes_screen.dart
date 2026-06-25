import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../favourites/controllers/favorites_controller.dart';

class YourRecipesScreen extends StatelessWidget {
  const YourRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favC = Get.find<FavoritesController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF9F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text('Your Recipes',
            style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            )),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: Obx(() {
        final meals = favC.favoriteMeals;

        if (meals.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book_outlined,
                    size: 64, color: AppColors.textHint),
                SizedBox(height: 16),
                Text('No saved recipes yet',
                    style: TextStyle(
                      fontSize: 16, color: AppColors.textSecondary,
                    )),
                SizedBox(height: 8),
                Text(
                  'Recipes you favorite will appear here',
                  style: TextStyle(
                    fontSize: 13, color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
          itemCount: meals.length,
          itemBuilder: (_, i) {
            final meal = meals[i];
            return GestureDetector(
              onTap: () => Get.toNamed(
                AppRoutes.mealDetail,
                arguments: meal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        meal.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundGrey,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(Icons.image_outlined,
                                  color: AppColors.textHint),
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(meal.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textPrimary,
                        height: 1.4,
                      )),
                  Text(meal.duration,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      )),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}