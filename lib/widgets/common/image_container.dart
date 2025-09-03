import 'package:flutter/cupertino.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class ImageContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color shadowColor;
  final String label;
  final VoidCallback onTap;

  const ImageContainer({
    super.key,
    required this.icon,
    required this.color,
    required this.shadowColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.hugeRadius),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, AppConstants.largeShadowOffset),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: AppConstants.hugeIconSize,
              color: shadowColor,
            ),
          ),
          const SizedBox(height: AppConstants.mediumSpacing),
          Text(
            label,
            style: FontUtils.getMediumTextStyle(
              fontSize: 16,
              color: CupertinoColors.secondaryLabel,
            ),
          ),
        ],
      ),
    );
  }
}
