import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/groceries_controller.dart';

class AddGroceryScreen extends StatefulWidget {
  const AddGroceryScreen({super.key});

  @override
  State<AddGroceryScreen> createState() => _AddGroceryScreenState();
}

class _AddGroceryScreenState extends State<AddGroceryScreen> {
  final _search = TextEditingController();
  final _suggestions = [
    'bananas', 'bread', 'eggs', 'apples', 'milk',
    'almond milk', 'fish', 'oranges', 'butter', 'yogurt',
    'pasta', 'tomatoes', 'garlic', 'onions', 'spinach',
  ];

  List<String> get _filtered => _search.text.isEmpty
      ? _suggestions
      : _suggestions
      .where((s) =>
      s.toLowerCase().contains(_search.text.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    final c = Get.find<GroceriesController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // ── Search Bar ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _search,
                autofocus: true,
                onChanged: (_) => setState(() {}),
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'Add something...',
                  hintStyle: const TextStyle(
                      color: AppColors.textHint),
                  prefixIcon: const Icon(Icons.search,
                      color: AppColors.textHint),
                  filled: true,
                  fillColor: AppColors.backgroundGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),

            // ── Suggestions List ──
            Expanded(
              child: ListView.separated(
                itemCount: _filtered.length,
                separatorBuilder: (_, __) => const Divider(
                    height: 1, color: AppColors.divider,
                    indent: 16, endIndent: 16),
                itemBuilder: (_, i) => ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  leading: GestureDetector(
                    onTap: () {
                      c.addItem(_filtered[i]);
                      Get.back();
                    },
                    child: Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add,
                          color: AppColors.textPrimary, size: 16),
                    ),
                  ),
                  title: Text(_filtered[i],
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      )),
                  onTap: () {
                    c.addItem(_filtered[i]);
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }
}