import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CareDropOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onCompleted;

  const CareDropOtpField({
    super.key,
    this.length = 6,
    this.onChanged,
    this.onCompleted,
  });

  @override
  State<CareDropOtpField> createState() => _CareDropOtpFieldState();
}

class _CareDropOtpFieldState extends State<CareDropOtpField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers = List.generate(widget.length, (index) => TextEditingController());

    for (int i = 0; i < widget.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < widget.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        _notifyChanged();
      });
    }
  }

  void _notifyChanged() {
    String currentOtp = _controllers.map((c) => c.text).join();
    if (widget.onChanged != null) {
      widget.onChanged!(currentOtp);
    }
    if (currentOtp.length == widget.length && widget.onCompleted != null) {
      widget.onCompleted!();
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 48,
          height: 56,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: AppTextStyles.headlineLgMobile,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.inputBackground,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.outlineVariant),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            },
          ),
        );
      }),
    );
  }
}
