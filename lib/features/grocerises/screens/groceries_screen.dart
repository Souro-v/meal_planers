import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_planers/features/grocerises/screens/shop_online_screen.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/groceries_controller.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GroceriesController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Groceries',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.addGrocery),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.textPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Obx(() {
                final grouped = c.grouped;
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    // ── Allergen Warning ──
                    if (c.showAllergenWarning.value) ...[
                      _AllergenWarning(onDismiss: c.dismissAllergenWarning),
                      const SizedBox(height: 16),
                    ],

                    // ── Category Groups ──
                    ...grouped.entries.map(
                      (entry) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 12),
                            child: Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Column(
                              children: entry.value.asMap().entries.map((e) {
                                final isLast = e.key == entry.value.length - 1;
                                return _GroceryTile(
                                  item: e.value,
                                  onToggle: () => c.toggleItem(e.value.id),
                                  showDivider: !isLast,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                );
              }),
            ),

            // ── Shop Online Button ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const ShopOnlineScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Shop Online',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Allergen Warning ─────────────────────────────────────
class _AllergenWarning extends StatelessWidget {
  final VoidCallback onDismiss;

  const _AllergenWarning({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD94F3D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Allergen Warning',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ingredients with a ⚠️ symbol may contain allergens. '
            'Tap an ingredient for more details, and make sure to '
            'purchase an allergen-free variety.',
            style: TextStyle(fontSize: 13, color: Colors.white, height: 1.5),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onDismiss,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Got It!',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD94F3D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Grocery Tile ─────────────────────────────────────────
class _GroceryTile extends StatelessWidget {
  final item;
  final VoidCallback onToggle;
  final bool showDivider;

  const _GroceryTile({
    required this.item,
    required this.onToggle,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: item.isChecked ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: item.isChecked ? AppColors.primary : AppColors.border,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: item.isChecked
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
          ),
          title: Row(
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 15,
                  color: item.isChecked
                      ? AppColors.textHint
                      : AppColors.textPrimary,
                  decoration: item.isChecked
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              if (item.hasAllergen) ...[
                const SizedBox(width: 6),
                const Text('⚠️', style: TextStyle(fontSize: 12)),
              ],
            ],
          ),
          trailing: Text(
            item.quantity,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          onTap: onToggle,
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: AppColors.divider,
          ),
      ],
    );
  }
}
