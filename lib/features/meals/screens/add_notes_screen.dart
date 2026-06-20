import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text(
          'Notes',
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
            icon: const Icon(Icons.more_horiz,
                color: AppColors.textPrimary),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: notesController,
          maxLines: null,
          expands: true,
          autofocus: true,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textPrimary,
            height: 1.6,
          ),
          decoration: const InputDecoration(
            hintText: 'Write your notes here...',
            hintStyle: TextStyle(color: AppColors.textHint),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),

      // ── Bottom Buttons ──
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          children: [
            // Cancel
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Save
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: save note
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 15,
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