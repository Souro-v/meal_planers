import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';

class FoodWasteScreen extends StatelessWidget {
  const FoodWasteScreen({super.key});

  static const _tips = [
    ('Plan your meals', 'Stick to your weekly meal plan to avoid buying food you won\'t use.'),
    ('Check before you shop', 'Always check your fridge and pantry before heading to the store.'),
    ('Store food properly', 'Learn the best ways to store each type of food to extend freshness.'),
    ('Use your leftovers', 'Cook once, eat twice. Leftovers make great next-day lunches.'),
    ('Understand expiry dates', '"Best before" doesn\'t mean "throw away". Use your senses to judge.'),
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
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text('Food Waste Savings',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Stats Card ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    width: 72, height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('1lb',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('You\'ve saved',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF388E3C),
                      )),
                  const Text('1 lb of food',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B5E20),
                      )),
                  const SizedBox(height: 8),
                  const Text(
                    'That\'s equivalent to saving \$3.20 '
                        'and reducing 1.3 kg of CO₂ emissions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF388E3C),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Progress ──
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Weekly Progress',
                      style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      )),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      minHeight: 8,
                      backgroundColor: AppColors.backgroundGrey,
                      valueColor: const AlwaysStoppedAnimation(
                          Color(0xFF4CAF50)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2 / 5 meals cooked',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          )),
                      Text('40%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF388E3C),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Tips ──
            const Text('Tips to Reduce Food Waste',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                )),
            const SizedBox(height: 12),

            ...List.generate(_tips.length, (i) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('${i + 1}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF388E3C),
                          )),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_tips[i].$1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            )),
                        const SizedBox(height: 4),
                        Text(_tips[i].$2,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                              height: 1.5,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}