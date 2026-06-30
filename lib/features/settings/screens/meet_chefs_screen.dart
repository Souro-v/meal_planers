import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../../meals/controllers/meal_plan_controller.dart';
import '../models/chef_model.dart';

class MeetChefsScreen extends StatelessWidget {
  const MeetChefsScreen({super.key});

  static const _chefs = [
    ChefModel(
      id: 'c1',
      name: 'Marcus Rivera',
      specialty: 'Mediterranean & Healthy',
      bio:
          'Marcus has spent 15 years perfecting the art of Mediterranean cooking, focusing on fresh ingredients and bold flavors.',
      emoji: '👨‍🍳',
      recipeCount: 48,
      recipeIds: ['rc2', 'rp1', 'veg6'],
    ),
    ChefModel(
      id: 'c2',
      name: 'Yuki Tanaka',
      specialty: 'Asian Fusion',
      bio:
          'Born in Tokyo, Yuki blends traditional Japanese techniques with modern flavors to create unique and delicious dishes.',
      emoji: '👩‍🍳',
      recipeCount: 36,
      recipeIds: ['rp2', 'veg4', 'rp3'],
    ),
    ChefModel(
      id: 'c3',
      name: 'Sofia Bianchi',
      specialty: 'Italian & Pasta',
      bio:
          'Sofia grew up in a small Italian village where cooking was a family tradition. Her pasta dishes are legendary.',
      emoji: '🧑‍🍳',
      recipeCount: 52,
      recipeIds: ['rc3', 'veg3', 'veg7'],
    ),
    ChefModel(
      id: 'c4',
      name: 'Amara Osei',
      specialty: 'Plant-Based & Vegan',
      bio:
          'Amara is passionate about showing that vegan food can be just as rich, satisfying, and delicious as any other cuisine.',
      emoji: '👩‍🍳',
      recipeCount: 29,
      recipeIds: ['mp3', 'veg5', 'veg2'],
    ),
    ChefModel(
      id: 'c5',
      name: 'Daniel Park',
      specialty: 'Quick & Easy Meals',
      bio:
          'As a busy father of three, Daniel specializes in delicious meals that take 30 minutes or less to prepare.',
      emoji: '👨‍🍳',
      recipeCount: 61,
      recipeIds: ['mp1', 'mp2', 'veg1'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF9F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
        title: const Text('Meet Our Chefs',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            )),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _chefs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) => _ChefCard(chef: _chefs[i]),
      ),
    );
  }
}

class _ChefCard extends StatefulWidget {
  final ChefModel chef;

  const _ChefCard({required this.chef});

  @override
  State<_ChefCard> createState() => _ChefCardState();
}

class _ChefCardState extends State<_ChefCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ── Avatar ──
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0D9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(widget.chef.emoji,
                      style: const TextStyle(fontSize: 30)),
                ),
              ),
              const SizedBox(width: 14),

              // ── Info ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.chef.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        )),
                    const SizedBox(height: 2),
                    Text(widget.chef.specialty,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(height: 4),
                    Text('${widget.chef.recipeCount} recipes',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        )),
                  ],
                ),
              ),

              // ── Expand ──
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          // ── Bio (expandable) ──
          // Bio (expandable)
          if (_expanded) ...[
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppColors.divider),
            const SizedBox(height: 12),
            Text(widget.chef.bio,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.6,
                )),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                onPressed: () {
                  final recipes = MealPlanController.allMeals
                      .where((m) => widget.chef.recipeIds.contains(m.id))
                      .toList();
                  Get.toNamed(
                    AppRoutes.seeAll,
                    arguments: {
                      'title': '${widget.chef.name}\'s Recipes',
                      'meals': recipes,
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('View Recipes',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    )),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
