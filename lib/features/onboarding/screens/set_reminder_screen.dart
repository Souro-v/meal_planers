import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controller/preference_controller.dart';
import '../widgets/preference_scaffold.dart';

class SetReminderScreen extends StatelessWidget {
  const SetReminderScreen({super.key});

  static const _times = [
    '6:00 AM', '7:00 AM', '8:00 AM', '9:00 AM',
    '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM',
  ];

  static const _days = [
    'Mondays', 'Tuesdays', 'Wednesdays', 'Thursdays',
    'Fridays', 'Saturdays', 'Sundays',
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PreferenceController>();

    return PreferenceScaffold(
      step: 5,
      title: 'Set a weekly reminder',
      buttonText: 'Done',
      onContinue: c.savePreferences,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Toggle Row ──
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Remind me to make a meal plan',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Switch(
                  value: c.reminderEnabled.value,
                  onChanged: (v) => c.reminderEnabled.value = v,
                  activeThumbColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.border,
                ),
              ],
            )),
            const SizedBox(height: 24),

            // ── Time Dropdown ──
            Obx(() => _DropdownField(
              value: c.selectedTime.value,
              items: _times,
              enabled: c.reminderEnabled.value,
              onChanged: (v) {
                if (v != null) c.selectedTime.value = v;
              },
            )),
            const SizedBox(height: 12),

            // ── Day Dropdown ──
            Obx(() => _DropdownField(
              value: c.selectedDay.value,
              items: _days,
              enabled: c.reminderEnabled.value,
              onChanged: (v) {
                if (v != null) c.selectedDay.value = v;
              },
            )),
          ],
        ),
      ),
    );
  }
}

// ── Dropdown Field ───────────────────────────────────────
class _DropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final bool enabled;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: enabled ? Colors.white : const Color(0xFFF5F5F5),
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down,
            color: AppColors.textSecondary),
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w400,
        ),
        items: items
            .map((t) => DropdownMenuItem(value: t, child: Text(t)))
            .toList(),
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}