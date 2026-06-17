import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controller/onboarding_controller.dart';

// ── Slide Data ───────────────────────────────────────────
class _OnboardingData {
  final String image;
  final String title;
  final String description;

  const _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

const _slides = [
  _OnboardingData(
    image: 'assets/images/onboarding1.png',
    title: 'Personalized meal\nplanning',
    description:
    'Pick your week\'s meals in minutes. With over 200 personalization '
        'options, eat exactly how you want to eat.',
  ),
  _OnboardingData(
    image: 'assets/images/onboarding2.png',
    title: 'Simple, stress-free\ngrocery shopping',
    description:
    'Grocery shop once per week with an organized '
        '"done for you" shopping list.',
  ),
  _OnboardingData(
    image: 'assets/images/onboarding3.png',
    title: 'Delicious, healthy meals\nmade easy',
    description:
    'Easily cook healthy, delicious meals in about '
        '30 minutes, from start to finish.',
  ),
];

// ── Main Screen ──────────────────────────────────────────
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // ── Back Button ──
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.textPrimary),
                ),
              ),
            ),

            // ── PageView ──
            Expanded(
              child: PageView.builder(
                controller: c.pageController,
                onPageChanged: c.onPageChanged,
                itemCount: _slides.length,
                itemBuilder: (_, i) => _SlidePage(data: _slides[i]),
              ),
            ),

            // ── Dot Indicators ──
            Obx(() => _DotIndicator(
              count: _slides.length,
              current: c.currentPage.value,
            )),
            const SizedBox(height: 32),

            // ── Buttons ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Continue
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: c.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Skip
                  GestureDetector(
                    onTap: c.skip,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Single Slide ─────────────────────────────────────────
class _SlidePage extends StatelessWidget {
  final _OnboardingData data;

  const _SlidePage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [

          // ── Illustration ──
          Expanded(
            child: Image.asset(
              data.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 32),

          // ── Title ──
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),

          // ── Description ──
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ── Dot Indicator ────────────────────────────────────────
class _DotIndicator extends StatelessWidget {
  final int count;
  final int current;

  const _DotIndicator({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}