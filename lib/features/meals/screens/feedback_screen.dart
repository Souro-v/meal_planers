import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/feedback_controller.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(FeedbackController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: AppColors.textPrimary),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // ── Rating Label ──
            const Text(
              'How was this recipe?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // ── Star Rating ──
            Obx(
              () => Row(
                children: List.generate(5, (i) {
                  final filled = i < c.rating.value;
                  return GestureDetector(
                    onTap: () => c.setRating(i + 1),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        filled ? Icons.star : Icons.star_border,
                        color: filled
                            ? AppColors.primary
                            : const Color(0xFFD9D9D9),
                        size: 38,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 28),

            // ── Comments Label ──
            const Text(
              'Comments for the chef?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // ── Comment Field ──
            TextField(
              controller: c.commentController,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
                height: 1.5,
              ),
              decoration: InputDecoration(
                hintText: 'Write your comments...',
                hintStyle: const TextStyle(color: AppColors.textHint),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ── Send Button ──
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Obx(
          () => SizedBox(
            // ← child: add করো
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: c.isLoading.value ? null : c.send,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor: AppColors.primaryLight,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: c.isLoading.value
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
