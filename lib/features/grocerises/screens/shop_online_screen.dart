import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app/themes/app_colors.dart';

class ShopOnlineScreen extends StatefulWidget {
  const ShopOnlineScreen({super.key});

  @override
  State<ShopOnlineScreen> createState() => _ShopOnlineScreenState();
}

class _ShopOnlineScreenState extends State<ShopOnlineScreen> {
  bool showShortcut = true;

  static const _stores = [
    _StoreData(
      name: 'Asda',
      color: Color(0xFF78BE20),
      letter: 'A',
      url: 'https://groceries.asda.com',
    ),
    _StoreData(
      name: 'Ocado',
      color: Color(0xFFB5121B),
      letter: 'O',
      url: 'https://www.ocado.com',
    ),
    _StoreData(
      name: 'Tesco',
      color: Color(0xFF004B97),
      letter: 'T',
      url: 'https://www.tesco.com/groceries',
    ),
  ];

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!mounted) return;
      Get.snackbar(
        'Error', 'Could not open the link.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close,
              color: AppColors.textPrimary),
        ),
        title: const Text('Shop Online',
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Store List ──
            ...List.generate(_stores.length, (i) => Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 4),
                  leading: Container(
                    width: 48, height: 48,
                    decoration: BoxDecoration(
                      color: _stores[i].color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(_stores[i].letter,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  title: Text(_stores[i].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      )),
                  trailing: const Icon(Icons.chevron_right,
                      color: AppColors.textSecondary),
                  onTap: () => _launchUrl(_stores[i].url),
                ),
                const Divider(
                    height: 1, indent: 24,
                    endIndent: 24, color: AppColors.border),
              ],
            )),
            const SizedBox(height: 16),

            // ── Region Note ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Only showing stores available in your country.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Show All ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity, height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Coming Soon',
                      'More stores will be added soon!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.primary,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(16),
                      borderRadius: 12,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Show All Stores',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ── Settings Section ──
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
            ),
            const SizedBox(height: 8),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Access online shopping options quickly with a '
                    'shortcut button on your grocery list.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Toggle ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        setState(() => showShortcut = !showShortcut),
                    child: Container(
                      width: 22, height: 22,
                      decoration: BoxDecoration(
                        color: showShortcut
                            ? AppColors.primary
                            : Colors.transparent,
                        border: Border.all(
                          color: showShortcut
                              ? AppColors.primary
                              : AppColors.border,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: showShortcut
                          ? const Icon(Icons.check,
                          color: Colors.white, size: 14)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('Show online shopping shortcut',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // ── Feedback ──
            const Center(
              child: Text(
                'How can we make online shopping better for you?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: GestureDetector(
                onTap: () => _launchUrl(
                  'mailto:support@mealtime.app?subject=Mealtime%20Shopping%20Feedback',
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.feedback_outlined,
                        color: AppColors.textSecondary, size: 16),
                    SizedBox(width: 6),
                    Text('Give us feedback',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _StoreData {
  final String name;
  final Color color;
  final String letter;
  final String url;
  const _StoreData({
    required this.name,
    required this.color,
    required this.letter,
    required this.url,
  });
}