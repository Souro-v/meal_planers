import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/collection_controller.dart';

class SelectCollectionsScreen extends StatelessWidget {
  const SelectCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CollectionController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Back ──
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back,
                    color: AppColors.textPrimary),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            const SizedBox(height: 16),

            // ── Title + Subtitle ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select collections',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      )),
                  SizedBox(height: 8),
                  Text(
                    'Create your own collections for quick access to all '
                        'your favorites. Add your first collection to get started.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Collection List ──
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() => Column(
                  children: [
                    // Collection tiles
                    ...c.collections.map((col) {
                      final selected = c.isSelected(col.id);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () => c.toggleSelection(col.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xFFFFF0D9)
                                  : Colors.white,
                              border: Border.all(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.border,
                                width: selected ? 1.5 : 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [

                                // Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    col.imageUrl,
                                    width: 56, height: 56,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      width: 56, height: 56,
                                      color: AppColors.backgroundGrey,
                                      child: const Icon(Icons.image_outlined,
                                          color: AppColors.textHint),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),

                                // Name + count
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(col.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.textPrimary,
                                          )),
                                      const SizedBox(height: 4),
                                      Text('${col.recipeCount} Recipes',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppColors.textSecondary,
                                          )),
                                    ],
                                  ),
                                ),

                                // Checkbox
                                Container(
                                  width: 22, height: 22,
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? AppColors.primary
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: selected
                                          ? AppColors.primary
                                          : AppColors.border,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: selected
                                      ? const Icon(Icons.check,
                                      color: Colors.white, size: 14)
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    // ── Add New Collection button ──
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.addCollection),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: AppColors.textPrimary,
                                size: 20),
                            SizedBox(width: 8),
                            Text('Add New Collection',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),

            // ── Add Button ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
              child: SizedBox(
                width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: c.save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Add',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}