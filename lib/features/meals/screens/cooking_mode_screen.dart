import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/cooking_controller.dart';
import '../models/meal_model.dart';
import '../widgets/grocery_guide_popover.dart';

class CookingModeScreen extends StatelessWidget {
  const CookingModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = Get.arguments as MealModel;
    final c    = Get.put(CookingController(meal));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _showConfirmQuit(context, c, meal);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Obx(() => Stack(
            children: [

              // ── Main Content ──
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back + Progress
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () =>
                              _showConfirmQuit(context, c, meal),
                          icon: const Icon(Icons.arrow_back,
                              color: AppColors.textPrimary),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(height: 12),
                        _SegmentedProgressBar(
                          current: c.currentStep.value + 1,
                          total: meal.instructions.length,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Step content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Step Number
                          Text(
                            (c.currentStep.value + 1)
                                .toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Instruction Text
                          Text(
                            c.currentInstruction.step,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                              height: 1.4,
                            ),
                          ),

                          // Ingredient items
                          if (c.currentInstruction.items.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            ...c.currentInstruction.items.map((item) =>
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text('• $item',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                        height: 1.5,
                                      )),
                                )),
                          ],

                          // Timer Buttons
                          if (c.currentInstruction.timers.isNotEmpty) ...[
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 12,
                              children: c.currentInstruction.timers
                                  .map((mins) => GestureDetector(
                                onTap: () => c.startTimer(mins),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.textPrimary),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('$mins minutes',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      const SizedBox(width: 6),
                                      const Icon(Icons.play_arrow,
                                          size: 16),
                                    ],
                                  ),
                                ),
                              ))
                                  .toList(),
                            ),
                          ],

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Bar
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: AppColors.border)),
                    ),
                    child: Row(
                      children: [
                        // ☰ Steps list
                        GestureDetector(
                          onTap: () =>
                              _showStepsMenu(context, c, meal),
                          child: const Icon(Icons.menu,
                              color: AppColors.textPrimary, size: 28),
                        ),
                        const SizedBox(width: 16),
                        // Next / Finish
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: c.isLastStep
                                  ? () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (_) => const GroceryGuidePopover(),
                                ).then((_) => Get.back()); //
                              }
                                  : c.nextStep,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12)),
                              ),
                              child: Text(
                                c.isLastStep ? 'Finish' : 'Next',
                                style: const TextStyle(
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
                ],
              ),

              // ── Timer Overlay ──
              if (c.isTimerRunning.value)
                _TimerOverlay(c: c),
            ],
          )),
        ),
      ),
    );
  }

  void _showConfirmQuit(BuildContext context,
      CookingController c, MealModel meal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ConfirmQuitSheet(c: c, meal: meal),
    );
  }

  void _showStepsMenu(BuildContext context,
      CookingController c, MealModel meal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _StepsMenuSheet(c: c, meal: meal),
    );
  }
}

// ── Segmented Progress Bar ────────────────────────────────
class _SegmentedProgressBar extends StatelessWidget {
  final int current;
  final int total;
  const _SegmentedProgressBar(
      {required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final filled = i < current;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: i < total - 1 ? 4 : 0),
            decoration: BoxDecoration(
              color: filled
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

// ── Timer Overlay ─────────────────────────────────────────
class _TimerOverlay extends StatelessWidget {
  final CookingController c;
  const _TimerOverlay({required this.c});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0, right: 0, bottom: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Close
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: c.cancelTimer,
                child: const Icon(Icons.close,
                    color: AppColors.textSecondary, size: 22),
              ),
            ),

            // Timer label
            Text(
              '${c.activeTimerMins.value} minutes',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),

            // Countdown + +1min
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  c.formattedTime,
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: c.addMinute,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('+1 min',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF388E3C),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Description
            Text(
              c.currentInstruction.step,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Cancel Timer
            SizedBox(
              width: double.infinity, height: 48,
              child: OutlinedButton(
                onPressed: c.cancelTimer,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Cancel Timer',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    )),
              ),
            ),
            const SizedBox(height: 10),

            // Show Next Step
            if (!c.isLastStep)
              SizedBox(
                width: double.infinity, height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    c.cancelTimer();
                    c.nextStep();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    'Show Step ${c.currentStep.value + 2}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}

// ── Confirm Quit Sheet ────────────────────────────────────
class _ConfirmQuitSheet extends StatelessWidget {
  final CookingController c;
  final MealModel meal;
  const _ConfirmQuitSheet({required this.c, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 36),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Steps list
          ...List.generate(meal.instructions.length, (i) {
            final isCurrent = i == c.currentStep.value;
            return Column(
              children: [
                ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24),
                  leading: Text('${i + 1}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isCurrent
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: isCurrent
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      )),
                  title: Text(
                    meal.instructions[i].step,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: isCurrent
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right,
                      color: AppColors.textHint),
                  onTap: () => c.goToStep(i),
                ),
                const Divider(height: 1, color: AppColors.divider),
              ],
            );
          }),

          const SizedBox(height: 20),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Leave
                SizedBox(
                  width: double.infinity, height: 52,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back(); // sheet
                      Get.back(); // cooking mode
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Leave Cooking Mode',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        )),
                  ),
                ),
                const SizedBox(height: 12),

                // Continue
                SizedBox(
                  width: double.infinity, height: 52,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Continue Cooking',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Steps Menu Sheet (☰ button) ───────────────────────────
class _StepsMenuSheet extends StatelessWidget {
  final CookingController c;
  final MealModel meal;
  const _StepsMenuSheet({required this.c, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 36),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('All Steps',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
            ),
          ),
          ...List.generate(meal.instructions.length, (i) => Column(
            children: [
              ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 24),
                leading: Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(
                    color: i == c.currentStep.value
                        ? AppColors.primary
                        : AppColors.backgroundGrey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${i + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: i == c.currentStep.value
                              ? Colors.white
                              : AppColors.textSecondary,
                        )),
                  ),
                ),
                title: Text(
                  meal.instructions[i].step,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  ),
                ),
                onTap: () => c.goToStep(i),
              ),
              const Divider(height: 1, color: AppColors.divider),
            ],
          )),
        ],
      ),
    );
  }
}