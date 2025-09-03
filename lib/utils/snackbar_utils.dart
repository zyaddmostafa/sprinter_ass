import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'font_utils.dart';
import '../constants/app_constants.dart';

class SnackBarUtils {
  static void showCupertinoSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
  }) {
    (
      builder: (context) => Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor ?? CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withValues(alpha: 0.3),
                      blurRadius: AppConstants.largeShadowBlur,
                      offset: const Offset(0, AppConstants.mediumShadowOffset),
                    ),
                  ],
                ),
                child: Text(
                  message,
                  style: FontUtils.getMediumTextStyle(
                    fontSize: 16,
                    color: textColor ?? CupertinoColors.label,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
    );
  }
}
