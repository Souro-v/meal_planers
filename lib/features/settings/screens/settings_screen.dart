import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/services/auth_api_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _menuItems = [
    (Icons.eco_outlined, '1lb', 'Food Waste Savings', '/food-waste'),
    (Icons.tune, '', 'Eating Preferences', '/eating-preferences'),
    (Icons.restaurant_outlined, '', 'Your Recipes', '/your-recipes'),
    (Icons.share_outlined, '', 'Share Mealtime', '/share-mealtime'),
    (Icons.people_outline, '', 'Meet Our Chefs', '/meet-chefs'),
  ];

  void _showAccountMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => const _AccountMenuSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Title ──
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              // ── Profile ──
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backgroundGrey,
                            border: Border.all(
                              color: AppColors.border,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 44,
                            color: AppColors.textHint,
                          ),
                        ),

                        // FREE badge
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CAF50),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'FREE',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Email
                    GestureDetector(
                      onTap: () => _showAccountMenu(context),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'ramy@example.co.uk',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                           SizedBox(width: 4),
                           Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textSecondary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ── Upgrade Card ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0D9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upgrade to Pro',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Get exclusive recipes, nutritional information, '
                        'advanced filters, and more.',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(AppRoutes.upgrade),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Upgrade Now!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ── Menu Items ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: List.generate(_menuItems.length, (i) {
                      final isLast = i == _menuItems.length - 1;
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            leading: _menuItems[i].$2.isNotEmpty
                                ? Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _menuItems[i].$2,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF388E3C),
                                        ),
                                      ),
                                    ),
                                  )
                                : Icon(
                                    _menuItems[i].$1,
                                    color: AppColors.textPrimary,
                                    size: 22,
                                  ),
                            title: Text(
                              _menuItems[i].$3,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: AppColors.textHint,
                            ),
                            onTap: () {
                              if (_menuItems[i].$4.isNotEmpty) {
                                Get.toNamed(_menuItems[i].$4);
                              }
                            },
                          ),
                          if (!isLast)
                            const Divider(
                              height: 1,
                              indent: 16,
                              endIndent: 16,
                              color: AppColors.divider,
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountMenuSheet extends StatelessWidget {
  const _AccountMenuSheet();

  static const _items = [
    (Icons.person_outline, 'Edit Your Account'),
    (Icons.swap_horiz, 'Switch Accounts'),
    (Icons.add_circle_outline, 'Upgrade To Pro'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Close ──
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close,
                color: AppColors.textSecondary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ── Menu Items ──
          ...List.generate(
            _items.length,
            (i) => Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    _items[i].$1,
                    color: AppColors.textPrimary,
                    size: 22,
                  ),
                  title: Text(
                    _items[i].$2,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                    if (i == 0) Get.toNamed(AppRoutes.editAccount);
                    if (i == 2) Get.toNamed(AppRoutes.upgrade);
                  },
                ),
                if (i < _items.length - 1)
                  const Divider(height: 1, color: AppColors.divider),
              ],
            ),
          ),
          const SizedBox(height: 16),

// ── Logout Button ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon:
                    const Icon(Icons.logout, color: AppColors.error, size: 20),
                label: const Text('Log Out',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.error,
                    )),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Log Out',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )),
      content: const Text(
        'Are you sure you want to log out?',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel',
              style: TextStyle(color: AppColors.textSecondary)),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await AuthApiService.logout();
            Get.offAllNamed(AppRoutes.login);
          },
          child: const Text('Log Out',
              style: TextStyle(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              )),
        ),
      ],
    ),
  );
}
