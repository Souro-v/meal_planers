import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../meals/controllers/meal_plan_controller.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  final _pageController = PageController();
  int _currentPage      = 0;

  // Pro meals — MealPlanController থেকে isPro olan গুলো নেবো
  late final _proMeals = [
    ...MealPlanController.mostPopular,
    ...MealPlanController.recentlyCreated,
  ].where((m) => m.isPro).toList();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // ── Close ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close,
                      color: AppColors.textPrimary, size: 24),
                ),
              ),
            ),

            // ── Green area ──
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFE8F5E4),
                child: Stack(
                  children: [

                    // ── Decorative food icons ──
                    const Positioned(
                        top: 20, left: 16,
                        child: Text('🥕', style: TextStyle(fontSize: 28))),
                    const Positioned(
                        top: 10, right: 24,
                        child: Text('🍌', style: TextStyle(fontSize: 32))),
                    const Positioned(
                        bottom: 30, left: 24,
                        child: Text('🥦', style: TextStyle(fontSize: 28))),
                    const Positioned(
                        bottom: 20, right: 16,
                        child: Text('🍓', style: TextStyle(fontSize: 28))),

                    // ── Main content ──
                    Column(
                      children: [
                        const SizedBox(height: 24),

                        // Title
                        const Text('Unlock Exclusive Recipes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            )),
                        const SizedBox(height: 8),

                        const Text(
                          'Access new recipes every month\n'
                              'reserved for pro subscribers.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ── PageView of Pro meals ──
                        SizedBox(
                          height: 280,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _proMeals.isEmpty
                                ? 1 : _proMeals.length,
                            onPageChanged: (i) =>
                                setState(() => _currentPage = i),
                            itemBuilder: (_, i) {
                              if (_proMeals.isEmpty) {
                                return const SizedBox();
                              }
                              final meal = _proMeals[i];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.08),
                                        blurRadius: 20,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      // Image
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            const BorderRadius
                                                .vertical(
                                                top: Radius
                                                    .circular(20)),
                                            child: Image.asset(
                                              meal.imageUrl,
                                              width: double.infinity,
                                              height: 170,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context,
                                                  error, stackTrace) =>
                                                  Container(
                                                    height: 170,
                                                    color: AppColors
                                                        .backgroundGrey,
                                                    child: const Icon(
                                                        Icons.image_outlined,
                                                        color:
                                                        AppColors.textHint),
                                                  ),
                                            ),
                                          ),

                                          // Pro + badges
                                          Positioned(
                                            top: 10, left: 10,
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(6),
                                                  ),
                                                  child: const Text('Pro',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const SizedBox(width: 4),
                                                Container(
                                                  width: 26, height: 26,
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                      Icons.add,
                                                      size: 16,
                                                      color: AppColors
                                                          .textSecondary),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Meal name
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          meal.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textPrimary,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // ── Dots ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              _proMeals.isEmpty ? 4 : _proMeals.length,
                                  (i) {
                                final active = i == _currentPage;
                                return AnimatedContainer(
                                  duration:
                                  const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3),
                                  width: active ? 16 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: active
                                        ? AppColors.primary
                                        : const Color(0xFFCCCCCC),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Bottom white area ──
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                children: [

                  // ── Close bottom ──
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.close,
                          color: AppColors.textSecondary, size: 20),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ── Price ──
                  const Text(
                    '\$2.99 a month. Cancel anytime.',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Upgrade Button ──
                  SizedBox(
                    width: double.infinity, height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Payment
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Upgrade To Pro',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Restore Purchases ──
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Restore Purchases',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textPrimary,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}