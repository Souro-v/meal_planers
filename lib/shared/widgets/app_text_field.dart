import 'package:flutter/material.dart';
import '../../app/themes/app_colors.dart';
import '../utils/enums.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final bool readOnly;
  final int maxLines;
  final void Function(String)? onChanged;
  final FieldState fieldState;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.onChanged,
    this.fieldState = FieldState.normal,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  Color get _borderColor => switch (widget.fieldState) {
    FieldState.error   => AppColors.error,
    FieldState.success => AppColors.success,
    _                  => AppColors.border,
  };

  Widget? get _suffixIcon {
    if (widget.isPassword) {
      // Password field: success এ checkmark, otherwise eye toggle
      if (widget.fieldState == FieldState.success) {
        return const Icon(Icons.check_circle_outline,
            color: AppColors.success, size: 20);
      }
      return IconButton(
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.textHint, size: 20,
        ),
        onPressed: () => setState(() => _obscure = !_obscure),
      );
    }
    return switch (widget.fieldState) {
      FieldState.error   => const Icon(Icons.error_outline,
          color: AppColors.error, size: 20),
      FieldState.success => const Icon(Icons.check_circle_outline,
          color: AppColors.success, size: 20),
      _                  => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword && _obscure
              && widget.fieldState != FieldState.success,
          keyboardType: widget.keyboardType,
          readOnly: widget.readOnly,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.textHint, size: 20)
                : null,
            suffixIcon: _suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: _borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.fieldState == FieldState.error
                    ? AppColors.error
                    : AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}