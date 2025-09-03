import 'package:flutter/cupertino.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isPrimary;
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isPrimary = true,
    this.width,
    this.height,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? AppConstants.buttonHeight;
    final buttonWidth = width ?? double.infinity;
    final buttonBorderRadius = borderRadius ?? AppConstants.largeRadius;

    if (isPrimary) {
      return _buildPrimaryButton(
        context: context,
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
        buttonBorderRadius: buttonBorderRadius,
      );
    } else {
      return _buildSecondaryButton(
        context: context,
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
        buttonBorderRadius: buttonBorderRadius,
      );
    }
  }

  Widget _buildPrimaryButton({
    required BuildContext context,
    required double buttonHeight,
    required double buttonWidth,
    required double buttonBorderRadius,
  }) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: backgroundColor ?? CupertinoColors.systemBlue,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        onPressed: isLoading ? null : onPressed,
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required BuildContext context,
    required double buttonHeight,
    required double buttonWidth,
    required double buttonBorderRadius,
  }) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        onPressed: isLoading ? null : onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            border: Border.all(
              color: backgroundColor ?? CupertinoColors.systemBlue,
              width: 2.5,
            ),
          ),
          child: Center(
            child: _buildButtonContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return const CupertinoActivityIndicator(
        color: CupertinoColors.white,
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: AppConstants.mediumIconSize,
            color: textColor ?? CupertinoColors.white,
          ),
          const SizedBox(width: AppConstants.smallSpacing),
          Text(
            text,
            style: FontUtils.getBoldTextStyle(
              fontSize: 18,
              color: textColor ?? CupertinoColors.white,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: FontUtils.getBoldTextStyle(
        fontSize: 18,
        color: textColor ?? CupertinoColors.white,
      ),
    );
  }
}
