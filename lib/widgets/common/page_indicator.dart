import 'package:flutter/cupertino.dart';
import '../../constants/app_constants.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final double? size;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? spacing;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.size,
    this.activeColor,
    this.inactiveColor,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => _buildIndicatorDot(index),
      ),
    );
  }

  Widget _buildIndicatorDot(int index) {
    final isActive = index == currentPage;
    final dotSize = size ?? AppConstants.pageIndicatorSize;
    final dotSpacing = spacing ?? AppConstants.smallSpacing;

    return Container(
      width: dotSize,
      height: dotSize,
      margin: EdgeInsets.symmetric(horizontal: dotSpacing / 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? (activeColor ?? CupertinoColors.systemBlue)
            : (inactiveColor ?? CupertinoColors.systemGrey4),
      ),
    );
  }
}
