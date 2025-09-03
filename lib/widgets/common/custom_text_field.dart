import 'package:flutter/cupertino.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePassword;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.placeholder,
    this.validator,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePassword,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FontUtils.getMediumTextStyle(
            fontSize: 16,
            color: CupertinoColors.label,
          ),
        ),

        const SizedBox(height: AppConstants.smallSpacing),

        CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          obscureText: isPassword && !isPasswordVisible,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          decoration: BoxDecoration(
            border: Border.all(
              color: CupertinoColors.separator,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.mediumSpacing,
            vertical: AppConstants.mediumSpacing,
          ),
          style: FontUtils.getRegularTextStyle(fontSize: 16),
          suffix: _buildSuffix(),
        ),

        const SizedBox(height: AppConstants.smallSpacing),

        // Validation Error
        if (validator != null) _buildValidationError(),
      ],
    );
  }

  Widget? _buildSuffix() {
    if (!isPassword) return null;

    return CupertinoButton(
      padding: const EdgeInsets.only(right: AppConstants.smallSpacing),
      onPressed: onTogglePassword,
      child: Icon(
        isPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
        color: CupertinoColors.systemGrey,
        size: AppConstants.mediumIconSize,
      ),
    );
  }

  Widget _buildValidationError() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final error = validator?.call(value.text);
        if (error != null && value.text.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: AppConstants.smallSpacing),
            child: Text(
              error,
              style: FontUtils.getRegularTextStyle(
                fontSize: 14,
                color: CupertinoColors.systemRed,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
