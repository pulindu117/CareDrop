import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CareDropTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CareDropTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  State<CareDropTextField> createState() => _CareDropTextFieldState();
}

class _CareDropTextFieldState extends State<CareDropTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: AppTextStyles.bodyLg,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
        floatingLabelStyle: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
        filled: true,
        fillColor: AppColors.inputBackground,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineVariant, width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineVariant, width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.onSurfaceVariant,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
